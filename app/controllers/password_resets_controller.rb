class PasswordResetsController < ApplicationController
    def new
    end
  
    def create
        # raise params.inspect
      @user = User.find_by(email: params[:email].downcase)
      if @user
        PasswordMailer.with(user: @user).reset.deliver_now  
      end
      redirect_to root_path, notice: "If an account with an email is found. Check you email Cunt"
    end
  
    def edit
        @user=User.find_signed(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
            redirect_to login_path, alert: "Your token has expired. Please try again"
       
    end

    def update
        @user=User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to login_path notice: "Password changed successfully"
        end
    end
   private
   def password_params
    params.require(:user).permit(:password, :password_confirmation)
   end
end
   
   