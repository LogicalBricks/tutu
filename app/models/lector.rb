require 'rqrcode' 
require 'rqrcode/export/png'

class Lector < ActiveRecord::Base
  attr_accessible :grado, :grupo, :nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento, :qr
  has_many :prestamos
  has_many :libros, through: :prestamos
  has_many :libros_de_texto, through: :prestamos, foreign_key: 'libro_id'
  has_many :juegos, through: :prestamos, foreign_key: 'libro_id'

  mount_uploader :foto, FotoUploader
  mount_uploader :qr, CodigoUploader

  def nombre_completo
    nombre + " " + primer_apellido + " " + segundo_apellido
  end

  after_create :generar_codigo

  # Para estadísticas
  scope :mas_frecuentes, 
    joins( prestamos: :libro ).
    select('lectores.*, COUNT(prestamos.id) as prestados').
    group('lectores.id').
    order('prestados DESC')

  scope :mas_frecuentes_libros, 
    joins( prestamos: :libro ).
    where('libros.tipo' => false).
    select('lectores.*, COUNT(prestamos.id) as prestados').
    group('lectores.id').
    order('prestados DESC')

  scope :mas_frecuentes_juegos, joins( prestamos: :libro ).where('libros.tipo' => true).select('lectores.*, COUNT(prestamos.id) as prestados').group('lectores.id').order('prestados DESC')

  def self.mas_prestamos_grafica(tipo= '', limit= 0)
    case tipo.downcase 
    when 'libros'
      lectores = Lector.mas_frecuentes_libros
    when 'juegos'
      lectores = Lector.mas_frecuentes_juegos
    else
      lectores = Lector.mas_frecuentes
    end

    if limit > 0
      lectores.limit(limit)
    else
      lectores.all
    end
    lectores.map do |l| 
      {
        label: "#{l.nombre_completo}",
        value: l.prestados
      } 
    end
  end


private 
  def generar_codigo
      self.codigo = "U48A%05d" % self.id  
      temp_qr = RQRCode::QRCode.new(codigo.to_s, size: 2, level: :l).as_png
      temp_file_name = File.join(Rails.root, 'tmp', (0...8).map{(65+rand(26)).chr}.join )
      temp_file = temp_qr.save(temp_file_name)
      self.qr = File.open(temp_file_name)
      self.save!(validate: false)
  end


  scope :finder, lambda { |q| where("nombre like :q or primer_apellido like :q or segundo_apellido like :q", q: "%#{q}%") } 

  def as_json(options)
    full_name = nombre + " " + primer_apellido + " "+ segundo_apellido 
    { id: id, text: full_name }
  end 

end


