class CreateCashAccounts < ActiveRecord::Migration
  def change
    create_table :cash_accounts do |t|
      t.string :name
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
