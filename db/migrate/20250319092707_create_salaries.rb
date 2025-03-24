class CreateSalaries < ActiveRecord::Migration[7.1]
  def change
    create_table :salaries do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer :month
      t.integer :year
      t.decimal :amount

      t.timestamps
    end
  end
end
