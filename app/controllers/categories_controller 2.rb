class CategoriesController < ApplicationController
    def index
        render json: Category.all , status: 200
    end
end