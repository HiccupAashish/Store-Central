class ApplicationController < ActionController::Base
    include SessionsHelper
    helper_method :current_user
    helper_method :current_cart
    helper_method :total_price
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_cart
        session[:cart] ||= []
    end
    
    def total_price
        total_price = current_cart.reduce(0) do | sum,product|
             sum + (current_user.products.find(product.to_i)).price
        end
    end

    def total_profit
        total_profit = current_cart.reduce(0) do | sum,product|
             sum + (current_user.products.find(product.to_i)).profit
        end
    end

    def profit_revenue
        
    end

end
