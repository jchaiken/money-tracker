class AddPaidToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :paid, :boolean, default: false
    add_column :categories, :budget_amount, :decimal
  end
end
