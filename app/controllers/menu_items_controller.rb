class MenuItemsController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]
    def index 
        @menu = MenuItem.all
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
        @item = MenuItem.create(item_params)
        if @item.errors.any? 
            render json: @item.errors, status: :unprocessable_entity
        else 
            render json: @item, status: 201 
        end
    end

    def destroy 
        @item.delete
        render json: @item
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
        params.require(:menu_item).permit(:name, :available, :description, :price, :category_id)
    end
end
