class CategoriesController < ApplicationController
    before_action :is_signed_in?

    def index
       @category=current_user.categories
    end
    
    def show
        @category=current_user.categories
       @cat=current_user.categories.find(params[:id])     
    end

    def destroy
        @category= current_user.categories.find(params[:id])
        # @category.products.destroy
        @category.destroy
        redirect_to user_categories_path(current_user.id)
    end


end
