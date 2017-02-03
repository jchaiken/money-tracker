class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :explanation
      t.decimal :amount
      t.date :transaction_date
      t.string :category
      t.string :transaction_type
      t.integer :bank_account_id
      t.integer :cash_account_id
      t.integer :credit_card_id
      t.integer :bill_id

      t.timestamps null: false
    end
    
    add_index :transactions, :bank_account_id
    add_index :transactions, :cash_account_id
    add_index :transactions, :credit_card_id
    add_index :transactions, :bill_id
  end
end
