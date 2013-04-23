require 'rqrcode' 
require 'rqrcode/export/png'

class Libro < ActiveRecord::Base
  attr_accessible :autor, :editorial, :isbn, :titulo, :paginas, :descripcion, :cantidad, :tipo, :qr
  has_many :prestamos
  has_many :lectores, through: :prestamos

  validates :titulo, presence: true
  validates :autor, presence: true

  validates :isbn, length: { minimum: 2, maximum: 14 } 

  scope :libros, where(tipo: false)
  scope :libros, where(tipo: true)


  mount_uploader :qr, CodigoUploader

  after_create :generar_codigo

  scope :finder, lambda { |q| where("titulo like :q or autor like :q or descripcion like :q or isbn like :q or codigo like :q", q: "%#{q}%") } 

  #Para estadísticas
  #
  scope :mas_prestados,
    joins(:prestamos).
    select('libros.*, COUNT(prestamos.id) as prestados').
    group('libros.id').
    order('prestados DESC')

  scope :mas_prestados_libros,
    joins(:prestamos).
    select('libros.*, COUNT(prestamos.id) as prestados').
    group('libros.id').
    order('prestados DESC').
    where(tipo: false)

  scope :mas_prestados_juegos,
    joins(:prestamos).
    select('libros.*, COUNT(prestamos.id) as prestados').
    group('libros.id').
    order('prestados DESC').
    where(tipo: true)

  def self.mas_prestados_grafica(tipo= '', limit= 0)
    case tipo.downcase 
    when 'libros'
      libros = Libro.mas_prestados_libros
    when 'juegos'
      libros = Libro.mas_prestados_juegos
    else
      libros = Libro.mas_prestados
    end

    if limit > 0
      libros.limit(limit)
    else
      libros.all
    end
    libros.map do |l| 
      {
        label: l.titulo,
        value: l.prestados
      } 
    end
  end


private 
  def generar_codigo
      self.codigo = "U48M%05d" % self.id  
      temp_qr = RQRCode::QRCode.new(codigo.to_s, size: 4, level: :h).as_png
      temp_file_name = File.join(Rails.root, 'tmp', (0...8).map{(65+rand(26)).chr}.join )
      temp_file = temp_qr.save(temp_file_name)
      self.qr = File.open(temp_file_name)
      self.save!(validate: false)
  end

  
  def as_json(options)
    { id: id, text: titulo }
  end 
  
  def as_json(options)
    { id: id, text: titulo }
  end 
end
