class AddPrestadorToPrestamo < ActiveRecord::Migration
  def change
    add_column :prestamos, :prestador_id, :integer
  end
end
