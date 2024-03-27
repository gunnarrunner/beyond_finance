class CreateDeposits < ActiveRecord::Migration[7.1]
  def change
    create_table :deposits do |t|
      t.references :tradeline, null: false, foreign_key: true
      t.date :deposit_date
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
