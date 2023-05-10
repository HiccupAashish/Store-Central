class UsersController < ApplicationController
    layout "application" ,only: [new]
 
    def new
        @user= User.new
    end

    def show
        # raise params.inspect
        @user= User.find(session[:user_id])
    end

    def create
     @user = User.create(user_params)  
        if @user.save
            # raise @user.inspect
            redirect_to controller: :sessions ,action: :new
        else
          render 'new'
        end
    end

    def edit
        # raise params.inspect
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to controller: :products, action: :index
        else
          render 'edit'
        end
    end

    def destroy
        session.destroy    
    end

    private

    def user_params
        params.require(:user).permit([:name, :password, :password_confirmation, :image, :email])
    end
end
