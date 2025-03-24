class CreateInvestments < ActiveRecord::Migration[7.1]
  def change
    create_table :investments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :financial_year
      t.decimal :amount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end