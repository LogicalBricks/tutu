class Libro < ActiveRecord::Base
  attr_accessible :autor, :editorial, :isbn, :titulo, :paginas, :descripcion, :cantidad
  has_many :prestamos
  has_many :lectores, through: :prestamos

  validates :titulo, presence: true
  validates :autor, presence: true

  validates :isbn, length: { minimum: 2, maximum: 14 } 

  scope :finder, lambda { |q| where("titulo like :q or autor like :q or descripcion like :q", q: "%#{q}%") } 

  def as_json(options)
    { id: id, text: titulo }
  end 
end
