class HistoriesController < ApplicationController

    def index
        @history= History.all
    end

    def add_to_history
        @history=current_user.histories.create(amount: total_price)
        @history.updated_at = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        @history.item_sold=current_cart.length
        @history.gross_profit= total_profit
        @history.save
        current_cart.clear
        redirect_to user_home_path(current_user)
    end

    def destroy
     
        @history=History.find(params[:id])
        @history.destroy
        redirect_to user_histories_path(current_user)
    end

end
