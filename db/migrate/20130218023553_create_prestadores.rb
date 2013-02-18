class CreatePrestadores < ActiveRecord::Migration
  def change
    create_table :prestadores do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
