class AddQrToLibroAndLector < ActiveRecord::Migration
  def change
    add_column :libros, :qr, :string 
    add_column :lectores, :qr, :string 
  end
end
