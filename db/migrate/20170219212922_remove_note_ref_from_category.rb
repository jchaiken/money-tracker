class RemoveNoteRefFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :note_id, :integer
    remove_column :notes, :category, :string
    add_column :notes, :category_id, :integer
  end
end
