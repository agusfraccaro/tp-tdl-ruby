class ComentariosController < ApplicationController
    def create
    end

    def show
    end

    private
        def comentarios_params
            params.require(:comentario).permit(:user_id, :body, :recipe_id)
        end
end
