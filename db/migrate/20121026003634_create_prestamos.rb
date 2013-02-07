class CreatePrestamos < ActiveRecord::Migration
  def change
    create_table :prestamos do |t|
      t.references :lector 
      t.references :libro
      t.date :fecha_prestamo
      t.date :fecha_entrega
      t.boolean :perdida
      t.timestamps
    end
  end
end
