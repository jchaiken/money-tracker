class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.decimal :balance
      t.date :due_date
      t.references :transaction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
