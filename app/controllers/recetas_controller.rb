class RecetasController < ApplicationController
  before_action :authenticate_user

  def new
    @receta = Receta.new
  end

  def create
    @receta = Receta.new(receta_params)
    if @receta.save
      redirect_to login_path, notice: 'Receta creada satisfactoriamente.'
    else
      render :new
    end
  end

  def edit
  end

  def receta_params
    params.require(:user).permit(:nombre, :descripcion)
  end
end
