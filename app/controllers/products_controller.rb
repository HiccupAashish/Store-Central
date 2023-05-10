class ProductsController < ApplicationController

before_action :is_signed_in?
    
    def index
      @search= current_user.products.ransack(params[:q])
      @products=@search.result
    end

    def new
        @product= Product.new
        @product.custom =false
    end

    def create
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
     @product= Product.find(params[:id])
     current_cart.delete(params[:id])
     @product.categories.clear 
     @product.delete
      redirect_to user_products_path
    end

    def show
      @product= current_user.products.find(params[:id])
    end

    def new_custom_product
      @product=Product.new
      @product.custom =true
      
  end

  def custom_products
    @search= current_user.products.where(custom: true).ransack(params[:q])
      @products=@search.result
  end

  def out_of_stock
    #  current_user.categories.each do |cat|
    #   if cat.products==nil
    #     @category=
    #  end
  end


    private

    def product_entry
     
        params.require(:product).permit([:user_id,:name,:brought_price, :quantity,:price,:custom, category_ids:[], :categories => [ :user_id, :name] ])
    end
 
end
