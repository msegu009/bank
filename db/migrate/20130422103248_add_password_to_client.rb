class AddPasswordToClient < ActiveRecord::Migration
  def change
   add_column :clients, :password_digest, :string
  end
end
