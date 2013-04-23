class EstadisticasController < ApplicationController

  def index
    @total_prestados = Prestamo.count
    @total_en_prestamo = Prestamo.includes(:libros_de_texto).where('fecha_entrega IS NOT NULL').count
  end

  def lectores
    @lectores = Lector.mas_frecuentes.all
  end 

  def libros
    @libros= Libro.mas_prestados.all
  end 

end
