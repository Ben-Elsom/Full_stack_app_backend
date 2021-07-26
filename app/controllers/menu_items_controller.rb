class MenuItemsController < ApplicationController
    before_action :check_permission, only: [:create, :destroy]
    before_action :authenticate_user, except: [:index, :show]
    before_action :set_item, only: [:show, :update, :destroy]
    def index 
        @menuItems = MenuItem.all
        @menu = @menuItems.map do |item|
            item.attributes.merge({image_url: item.thumbnail.url, category: item.category.name })
        end
        render json: @menu
    end

    def show 
        begin
            render json: @item
        rescue 
            render json: {error: "item not found"}, status: 404
        end 
    end

    def update
        @item.update(item_params)
        if @item.errors.any? 
            render json: @item, status: :unprocessable_entity
        else 
            render json: @item, status: 201 
        end
    end


    def create 
        @item = current_user.menu_items.create(item_params)
        # if @item.save 
        #     render json: {test: "success"}
        # else 
        #     render json: {test: "failure" }
        # end
        if @item.errors.any? 
            render json: @item.errors, status: 401
        else 
            render json: @item, status: 201 
        end
    end

    def destroy 
        if @item.delete
            render json: {message: "Item successfully deleted"}
        else 
            render json: {error: "Item could not be deleted" }
        end
    end

    private 
    def set_item 
        begin 
            @item = MenuItem.find(params[:id])
        rescue 
            render json: {error: "item not found"}, status: 404
        end
    end

    def item_params 
        params.require(:menu_item).permit(:name, :available, :description, :price, :category_id, :thumbnail)
    end

    def check_permission 
        if !current_user.isAdmin 
            render json: {error: "You do not have permission to perform that action"}
        end
    end
end 