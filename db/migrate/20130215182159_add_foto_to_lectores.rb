class AddFotoToLectores < ActiveRecord::Migration
  def change
    add_column :lectores, :foto, :string
  end
end
