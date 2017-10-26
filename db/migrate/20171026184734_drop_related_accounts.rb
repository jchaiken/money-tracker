class DropRelatedAccounts < ActiveRecord::Migration[5.0]
  def change
    drop_table :related_accounts
  end
end
