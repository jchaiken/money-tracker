class RenameTransactionsTable < ActiveRecord::Migration
  def change
    rename_table :transactions, :notes
  end
end
