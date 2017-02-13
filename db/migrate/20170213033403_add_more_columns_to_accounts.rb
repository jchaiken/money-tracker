class AddMoreColumnsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :principal_balance, :decimal
    add_column :accounts, :apr, :decimal
    add_column :related_accounts, :principal_balance, :decimal
    add_column :related_accounts, :apr, :decimal
  end
end
