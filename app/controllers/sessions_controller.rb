class SessionsController < ApplicationController
    layout "sessions"

    def new
        
    end

    def omniauth
      # raise params.inspect
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.name = auth['info']['name']
        
        u.password = auth['uid']
      end
    # raise @user.inspect
      session[:user_id]=@user.id
      redirect_to user_home_path(current_user)

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            logged_in (user)
            redirect_to user_home_path(current_user)
        else
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
    def auth
        request.env['omniauth.auth']
      end

end