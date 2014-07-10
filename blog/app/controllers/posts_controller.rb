class PostsController < ApplicationController
	def new	
		@post = Post.new   # Nueva instancia llamada @post	
	end
	# def create
	# 	render :text => params[:post].inspect	# Toma los valores del formulario	
	# end

	def create
		# Cada modelo Rails puede ser inicializado con sus respectivos atributos, 
		# los cuales son automáticamente asignados a sus respectivas columnas de base de datos. 
 		#@post = Post.new(params[:post])  # No funciona sin permit
 		@post = Post.new(params[:post].permit(:title,:text)) 

 		if @post.save 		# Intenta guardar el modelo en la base de datos y devuelve un indicador si lo ha guardado o no
    		redirect_to :action => :show, :id => @post.id 		# Si lo guarda, direcciona al usuario a la acción show
  		else
    		render 'new'	# Si no, el objeto @post es regresado a la plantilla new cuando es interpretado.
    		# Esta interpretación se hace dentro de la misma solicitud que hace el envío del formulario, 
    		# mientras que redirect_to le dirá al navegador para emitir una nueva solicitud.
    	end	
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to :action => :index
	end

	def edit
    	@post = Post.find(params[:id]) 		# Busca los campos asociados al id correspondiente
	end

	def index
    	@posts = Post.all
	end

	def show
		# Se usa una variable de instancia (@post) para contener una referencia al objeto post.
		# Rails pasará todas las variables de instancia a la vista.
    	@post = Post.find(params[:id])	# Busca los campos asociados al id correspondiente    	
	end

	def update
		@post = Post.find(params[:id]) 		# Busca los campos asociados al id correspondiente 

		# if @post.update_attributes(:title => 'xxxxxxxxx') 	# Actualiza sólo el título con xxxxxxxxx
		# if @post.update_attributes(params[:post]) 	# No funciona sin permit
		if @post.update_attributes(params[:post].permit(:title,:text))		
			redirect_to :action => :show, :id => @post.id
		else
			render 'edit'
		end
	end
end