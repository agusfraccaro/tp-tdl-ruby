class CommentsController < ApplicationController
  def show
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.new({content: comment_params[:content], user_id: Actual.user.id, recipe_id: comment_params[:recipe_id]})
    if @comment.save
      redirect_to recipe_path(@recipe), notice: 'Comentario agregado exitosamente.'
    else
      redirect_to recipe_path(@recipe), alert: 'Hubo un error al agregar el comentario.'
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id]), notice: 'El comentario ha sido eliminado.'
  end

  private
  def comment_params
      params.require(:comment).permit(:user_id, :content, :recipe_id)
  end
end
