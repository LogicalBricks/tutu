class Lector < ActiveRecord::Base
  attr_accessible :grado, :grupo, :nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento
  has_many :prestamos
  has_many :libros, through: :prestamos
end


