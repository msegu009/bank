class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :client, index: true, null: false
      t.integer :number, null: false
      t.integer :balance, null: false, default: 0
      t.boolean :company, default: false

      t.timestamps
    end
  end
end
