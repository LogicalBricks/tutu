class CreateLibros < ActiveRecord::Migration
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :autor
      t.string :editorial
      t.string :isbn
      t.integer :paginas
      t.text :descripcion
      t.integer :cantidad 
      t.boolean :reposicion 

      t.timestamps
    end
  end
end
