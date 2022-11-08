class ApplicationController < ActionController::Base
    before_action :set_user_actual
    
    protected

    def set_user_actual
        if session[:user_id]
            Actual.user = User.find_by(id: session[:user_id])
        end 
    end

    def require_login
        unless Actual.user.present?
            flash[:alert] = "Debes iniciar sesión para acceder a esta página."
            redirect_to root_path
        end
    end
end
