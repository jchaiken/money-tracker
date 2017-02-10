class CreateAccountsTransactions < ActiveRecord::Migration
  def change
    create_table :accounts_transactions, id: false do |t|
      t.belongs_to :account, index: true
      t.belongs_to :transaction, index: true
    end
  end
end
