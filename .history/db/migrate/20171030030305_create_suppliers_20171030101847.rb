class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps
    end

    create_table :accounts do |t|
      t.belongs_to :suppliers, index: {unique: true}, foreign_key: true
      t.string :account_number
      t.timestamps
    end
  end
end
