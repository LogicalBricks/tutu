class Prestamo < ActiveRecord::Base
  attr_accessible :fecha_prestamo, :fecha_entrega, :perdida, :lector_id, :libro_id
  belongs_to :lector 
  belongs_to :libro
end
