class MainController < ApplicationController
    layout "application"
        def index
            @current_user=current_user
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

        def cart
           cart=current_cart
        end


        # def add_to_cart
        #     @product= current_user.products.find(params[:id])
        #     unless @product.quantity==0
        #         @product.quantity = ((@product.quantity).to_i) - 1
        #         @product.save
        #         current_cart << @product.id   
        #     else
        #         flash[:alert]= "Sorry out of stock"
        #     end
        #     redirect_to user_home_path(current_user)
           
        # end
        # def add_to_cart
        #     @product = current_user.products.find(params[:id])
        #     unless @product.quantity == 0
        #       @product.quantity -= 1
        #       @product.save
        #       if current_cart.include?(@product.id)
        #         cart_item = current_cart.find(@product.id)
        #         # cart_item.quantity += 1
        #         cart_item.price += @product.price
        #         cart_item.save
        #       else
        #         current_cart.create(product_id: @product.id, quantity: 1, price: @product.price)
        #       end
        #     else
        #       flash[:alert] = "Sorry, the product is out of stock."
        #     end
        #     redirect_to user_home_path(current_user)
        #   end


        def remove_from_cart
            # update_cart=current_user.products.find(params[:id])
            # update_cart.quantity = ((update_cart.quantity).to_i) +1
            # update_cart.save
            cart_id=current_user.carts.find{|item| item['product_id'] == params[:id].to_i}.id
            # raise cart_id.inspect
            a=current_user.carts
            a.find(cart_id).destroy


            current_cart.delete_if{|item| item['product_id'] == params[:id].to_i}
            # raise current_cart.inspect
            redirect_to user_home_path(current_user)
        end

end