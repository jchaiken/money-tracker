class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.decimal :balance
      t.date :due_date

      t.timestamps null: false
    end
  end
end
