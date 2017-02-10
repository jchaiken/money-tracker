class RemoveBankAccountRefFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :bank_account_id, :string
    remove_column :transactions, :cash_account_id, :string
    remove_column :transactions, :bill_id, :string
    remove_column :transactions, :credit_card_id, :string
  end
  remove_index :transactions, :bank_account_id
  remove_index :transactions, :bill_id
  remove_index :transactions, :cash_account_id
  remove_index :transactions, :credit_card_id
end
