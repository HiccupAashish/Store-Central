module SessionsHelper

    def logged_in(user)
        session[:user_id]=user.id
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_signed_in?
      !current_user.nil?
    end
end