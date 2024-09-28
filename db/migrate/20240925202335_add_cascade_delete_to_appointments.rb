class AddCascadeDeleteToAppointments < ActiveRecord::Migration[7.2]
  def change
    # Assuming you already have a foreign key in appointments table, drop it
    remove_foreign_key :appointments, :patients

    # Add the foreign key again with cascade delete
    add_foreign_key :appointments, :patients, on_delete: :cascade
  end
end
