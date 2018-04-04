class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :postcode

      t.timestamps
    end
  end
end
