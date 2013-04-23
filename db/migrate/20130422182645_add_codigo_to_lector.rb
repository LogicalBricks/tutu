class AddCodigoToLector < ActiveRecord::Migration
  def change
    add_column :lectores, :codigo, :string
  end
end
