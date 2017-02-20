class AddCategoryIndexToNotes < ActiveRecord::Migration
  def change
    add_index :notes, :category_id
    add_column :accounts, :credit_limit, :decimal
    add_column :related_accounts, :credit_limit, :decimal
  end
end
