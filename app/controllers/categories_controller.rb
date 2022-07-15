class CategoriesController < ApplicationController
    before_action :is_signed_in?

    def index
       
    end
    
    def show
       @category=current_user.categories.find(params[:id])     
    end

    def destroy
        @category= Category.find(params[:id])
        @category.destroy
        redirect_to user_categories_path(current_user.id)
    end


end
