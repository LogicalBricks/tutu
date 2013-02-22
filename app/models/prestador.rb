class Prestador < ActiveRecord::Base
  attr_accessible :nombre
  has_many :prestamos

  scope :finder, lambda { |q| where("nombre like :q", q: "%#{q}%") } 

  def as_json(options)
    { id: id, text: nombre }
  end 

end
