class SessionsController < ApplicationController
    layout "sessions"

    def new
        
    end

    def create
        # raise params.inspect
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            logged_in (user)
            # redirect_to controller: :main, action: :home_page
            redirect_to user_products_path(current_user)
        else
          # Create an error message.
          render 'new'
        end
      end

    def destroy
        session.destroy
        redirect_to controller: :sessions, action: :new
    end
    private

    def user_login
        params.require(:session).permit(:email.downcase, :password)
    end

end