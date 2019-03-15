class UsersController < ApplicationController
    
    def new
    
    end

    def show
        @nickname = current_user.nickname
        @reports = Report.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(5)
    end
    
    
    private
    def user_params
        params.require(:user).permit(:email, :nickname)
    end
    
end
