class ProductsController < ApplicationController

before_action :is_signed_in?
    
    def index
      @search= current_user.products.ransack(params[:q])
      @products=@search.result
      # @products= @current_user.products.all
    end

    def new
        @product= Product.new
    end

    def create
      # raise params.inspect
      @product = Product.create(product_entry)
      profit=((@product.price).to_i) - ((@product.brought_price).to_i)
      @product.profit = profit
      if @product.save
      redirect_to user_products_path(current_user)
      else
        render 'new'
      end
    end

    def edit
      @product= Product.find(params[:id])
    end

    def update 
      @product= Product.find(params[:id])
      if @product.update(product_entry)
        redirect_to user_products_path(current_user)
      else
        render 'edit'
      end
    end

    def destroy
      # raise params.inspect
     @product= Product.find(params[:id])
      @product.destroy
      redirect_to user_products_path
    end

    def show
      @product= current_user.products.find(params[:id])
      # raise @product.brought_price.inspect
    end

    private

    def product_entry
        params.require(:product).permit([:user_id,:name,:brought_price, :quantity,:price, category_ids:[], categories: [:name, :user_id] ])
    end
 
end
