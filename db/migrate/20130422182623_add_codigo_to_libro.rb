class AddCodigoToLibro < ActiveRecord::Migration
  def change
    add_column :libros, :codigo, :string
  end
end
