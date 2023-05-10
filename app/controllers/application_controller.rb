class ApplicationController < ActionController::Base
    include SessionsHelper
    helper_method :current_user
    helper_method :current_cart
    helper_method :total_price
   

    def current_cart
        session[:cart] ||= []
    end
    
    def total_price
        total_price = current_cart.reduce(0) do | sum,product|
            # raise cart.inspect
            # # raise sum.inspect
            # raise product['name'].inspect
             sum + ((current_user.products.find(product['product_id'].to_i)).price)* product['quantity'].to_i
            #  sum + (current_user.products.find(current_cart['product_id'].to_i)).price
        end
    end

    def total_profit
        total_profit = current_cart.reduce(0) do | sum,product|
             sum + ((current_user.products.find(product['product_id'].to_i)).profit)* product['quantity'].to_i
        end
    end

    

end
