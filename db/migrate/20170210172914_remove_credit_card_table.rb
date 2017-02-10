class RemoveCreditCardTable < ActiveRecord::Migration
  def change
    drop_table :credit_cards
    drop_table :bills
    drop_table :cash_accounts
    drop_table :bank_accounts
  end
end
