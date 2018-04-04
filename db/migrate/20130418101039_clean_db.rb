class CleanDb < ActiveRecord::Migration
  def change
    remove_column :accounts, :company
    remove_column :clients, :street
    remove_column :clients, :city
    remove_column :clients, :postcode
  end
end
