class ComentariosController < ApplicationController
    paginates_per 5
    def new
    end

    def create
    end

    def show
    end

    private
        def comentarios_params
            params.require(:comentario).permit(:user_id, :body, :recipe_id)
        end
end
