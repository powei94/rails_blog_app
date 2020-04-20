class AuthorSessionsController < ApplicationController
    def new
    end

    def create
        if login(params[:email], params[:password])
            redirect_back_or_to(articles_path, notice: "Autenticado exitosamente.")
        else
            flash.now.alert = "Inicio de sesión fallido."
            render action: :new
        end
    end
    
    def destroy
        logout
        redirect_to(articles_path, notice: "Has salido de tu sesión correctamente.")
    end
end
