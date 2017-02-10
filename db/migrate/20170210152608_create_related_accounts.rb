class CreateRelatedAccounts < ActiveRecord::Migration
  def change
    create_table :related_accounts do |t|
      t.string :name
      t.string :account_type
      t.decimal :balance
      t.date :due_date
      t.integer :account_id

      t.timestamps null: false
    end
    change_table :transactions do |t|
      t.remove :related_account
      t.integer :account_id
      t.integer :related_account_id
    end
    
    add_index :transactions, :account_id
    add_index :transactions, :related_account_id
    add_index :related_accounts, :account_id
    drop_table :accounts_transactions
  end
end
