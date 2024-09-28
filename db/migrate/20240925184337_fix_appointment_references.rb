class FixAppointmentReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :doctor_id
    add_reference :appointments, :doctor, foreign_key: { to_table: :users }
  end
end
