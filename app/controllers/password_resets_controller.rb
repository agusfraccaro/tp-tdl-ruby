class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(mail: params[:mail])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_later
        end

        redirect_to root_path, notice: "Si existe una cuenta registrada a ese mail, se enviará un link para cambiar la contraseña."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to login_path, alert: 'Tu token ha expirado. Por favor, intenta nuevamente.'
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to login_path, notice: 'Tu contraseña ha sido actualizada. Por favor, inicia sesión.'
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end