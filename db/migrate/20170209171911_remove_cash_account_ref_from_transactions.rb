class RemoveCashAccountRefFromTransactions < ActiveRecord::Migration
  def change
    remove_foreign_key :transactions, column: :cash_account_id
    remove_foreign_key :transactions, column: :bank_account_id
    remove_foreign_key :transactions, column: :bill_id
    remove_foreign_key :transactions, column: :credit_card_id
  end
end
