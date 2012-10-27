class Prestamo < ActiveRecord::Base
  belongs_to :lector 
  belongs_to :libro
  # attr_accessible :title, :body
end
