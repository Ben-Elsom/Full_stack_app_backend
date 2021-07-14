class ApplicationController < ActionController::API
    def index 
        @menu = MenuItem.all
        render json @menu
    end
end
