class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Usuario creado satisfactoriamente.'
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to cookpedia_path, notice: 'Usuario actualizado correctamente.'
    else
      render :new, notice: 'Hubo un error al editar el usuario.'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find_by(id: session[:user_id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :mail, :password, :password_confirmation)
  end
end
