class AddMinimumPaymentToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :minimum_payment, :decimal
    add_column :related_accounts, :minimum_payment, :decimal
    remove_column :accounts, :principal_balance, :decimal
    remove_column :related_accounts, :principal_balance, :decimal
  end
end
