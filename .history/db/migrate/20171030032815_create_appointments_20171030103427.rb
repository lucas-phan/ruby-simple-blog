class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :physicians
      t.belongs_to :patients
      t.datetime :appointment_date
      t.timestamps
    end

    create_table physicians do |t|
      t.string :name
      t.timestamps
    end

    create_table patients do |t|
      t.string :name
      t.timestamps
    end
  end
end
