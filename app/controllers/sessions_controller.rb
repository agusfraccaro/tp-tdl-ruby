class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(mail: params[:mail])
        puts user
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to cookpedia_path
        else 
            redirect_to login_path, alert: "Mail o contraseña inválidos."
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Se ha cerrado la sesión."
    end
end
