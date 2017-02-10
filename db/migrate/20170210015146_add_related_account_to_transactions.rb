class AddRelatedAccountToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :related_account, :string
  end
end
