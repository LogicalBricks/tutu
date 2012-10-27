class Libro < ActiveRecord::Base
  attr_accessible :autor, :editorial, :isbn, :titulo, :paginas, :descripcion, :cantidad
  has_many :prestamos
  has_many :lectores, through: :prestamos
end
