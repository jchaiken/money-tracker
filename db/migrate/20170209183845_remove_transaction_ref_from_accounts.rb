class RemoveTransactionRefFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :transaction_id, :string
  end
  remove_index :accounts, :transaction_id
end
