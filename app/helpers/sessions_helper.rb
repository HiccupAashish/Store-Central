module SessionsHelper

    def logged_in(user)
        session[:user_id]=user.id
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_signed_in?
      if current_user
      !current_user.nil?
      # else
      #   render :file => "public/500", :status => :unauthorized
      end
    end
end