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
        # raise session[:cart].inspect

        total_price = session[:cart].reduce(0) do | sum,product|
             sum + (current_user.products.find(product.to_i)).price
        end
    end

end
