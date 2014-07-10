class Post < ActiveRecord::Base
	# No soportado en Rails 4
	#attr_accessible :text, :title 	# Asegura que todos los cambios realizados a través de formularios HTML puedan editar los campos text y title

	validates :title, :presence => true, 	# El campo título es obligatorio
                      :length => { :minimum => 5 } 		# Debe contener al menos 5 caracteres

    has_many :comments
end
