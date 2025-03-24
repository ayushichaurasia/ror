class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer :month
      t.integer :year
      t.integer :unpaid_leaves

      t.timestamps
    end
  end
end
