class Prestamo < ActiveRecord::Base
  attr_accessible :fecha_prestamo, :fecha_entrega, :perdida, :lector_id, :libro_id, :prestador_id
  belongs_to :lector 
  belongs_to :libro
  belongs_to :prestador

  belongs_to :libro_de_texto, class_name: 'Libro', conditions: { libros: {tipo: false} }, foreign_key: 'libro_id'
  belongs_to :juego, class_name: 'Libro', conditions: { libros: {tipo: true} }, foreign_key: 'libro_id'

  scope :no_entregados, where(fecha_entrega: nil)
  scope :entregados, where('fecha_entrega IS NOT NULL')
end
