class CommentsController < ApplicationController
  def show
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.new({body: comment_params[:body], user_id: Actual.user.id, recipe_id: comment_params[:recipe_id]})
    if @comment.save
      redirect_to recipe_path(@recipe), notice: 'Comentario agregado exitosamente.'
    else
      redirect_to recipe_path(@recipe), alert: 'Hubo un error al agregar el comentario.'
    end
  end

  def destroy
  end

  private
  def comment_params
      params.require(:comment).permit(:user_id, :body, :recipe_id)
  end
end
