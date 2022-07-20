class MainController < ApplicationController
    layout "application"
        def index
            # @products=current_user.products.all
        end

        def home_page
            @search= current_user.products.ransack(params[:q])
            
            products=@search.result
            if products.length == current_user.products.length
                @products= nil
            else
                @products = products
            end
            @cart=current_cart
        end

        # def cart
        #    cart=current_cart
        # end


        def add_to_cart
            @product= current_user.products.find(params[:id])
            unless @product.quantity==0
                @product.quantity = ((@product.quantity).to_i) - 1
                @product.save
                current_cart << @product.id   
            else
                flash[:alert]= "Sorry out of stock"
            end
            redirect_to user_home_path(current_user)
           
        end
        
        def remove_from_cart
            update_cart=current_user.products.find(params[:id])
            update_cart.quantity = ((update_cart.quantity).to_i) +1
            update_cart.save
            current_cart.delete(update_cart.id)
            redirect_to user_home_path(current_user)
        end

end