class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true
      t.datetime :published_at
      t.timestamps
    end

    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
  end
end
