class HistoriesController < ApplicationController
    before_action :is_signed_in?
    def index
        @history=current_user.histories.all
        @product=current_user.products.all
        # raise product.inspect
    end

    def add_to_history
        @history=current_user.histories.create(amount: total_price)
        # raise current_cart.inspect
        product=[]
        quantity=[]
        current_cart.each do |item|
            # raise (item['product_id']).inspect
            # @history.product =item['product_id']
            product << item['product_id']
            quantity << item['quantity']
        end
        @history.product=product.join(',')
        @history.quantity=quantity.join(',')
        

        @history.updated_at = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
        @history.item_sold=current_cart.length
        @history.gross_profit= total_profit
        @history.save
        current_cart.clear
        current_user.carts.destroy_all
        redirect_to user_home_path(current_user)
    end

    def destroy
        @history=History.find(params[:id])
        @history.destroy
        redirect_to user_histories_path(current_user)
    end

    def show
        @history=History.find(params[:id])
        @product=current_user.products.all
        i=0
#         while i< ((@history.product.split(',')).length)
#        a= @product.find((@history.product.split(','))[i].to_i)
# raise a.inspect
#         end
    end

end
