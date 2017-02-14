class UpdateCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :transaction_id
    add_column :categories, :note_id, :integer
    
  end
end
