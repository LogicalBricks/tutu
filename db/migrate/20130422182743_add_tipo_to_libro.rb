class AddTipoToLibro < ActiveRecord::Migration
  def change
    add_column :libros, :tipo, :boolean, default: false
  end
end
