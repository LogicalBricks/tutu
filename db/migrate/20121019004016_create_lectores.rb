class CreateLectores < ActiveRecord::Migration
  def change
    create_table :lectores do |t|
      t.string :nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.integer :grado
      t.string :grupo
      t.date :fecha_nacimiento
      t.boolean :atencion_usaer
      t.timestamps
    end
  end
end
