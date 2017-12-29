class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :client
      t.references :staff
      t.string :unique_id
      t.string :subject
      t.string :description
      t.string :department
      t.integer :status

      t.timestamps
    end
  end
end
