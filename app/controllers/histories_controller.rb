class HistoriesController < ApplicationController

    def index
        @history= History.all
    end

    def add_to_history
       
        @history=current_user.histories.create(amount: total_price)
        @history.updated_at = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        current_cart.each do |product|
        @history.products << product
        end
        @history.save
        raise @history.inspect
        current_cart.clear
        redirect_to user_histories_path(current_user)
    end
end
