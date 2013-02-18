class Lector < ActiveRecord::Base
  attr_accessible :grado, :grupo, :nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento
  has_many :prestamos
  has_many :libros, through: :prestamos

  mount_uploader :foto, FotoUploader

  def nombre_completo
    nombre + " " + primer_apellido + " " + segundo_apellido
  end

  scope :finder, lambda { |q| where("nombre like :q or primer_apellido like :q or segundo_apellido like :q", q: "%#{q}%") } 

  def as_json(options)
    full_name = nombre + " " + primer_apellido + " "+ segundo_apellido 
    { id: id, text: full_name }
  end 

end


