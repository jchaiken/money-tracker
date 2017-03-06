class Category < ActiveRecord::Base
  has_many :notes
  validates :name, presence: true, uniqueness: true
  
  def this_months_totals
    # iterate through each category
    self.each do |c|
      # iterate through each transaction in each category
      c.note.each do |t|
        # add each debit transaction to the total
        if t.transactionn_type == "Debit"
          category_total += t.amount
        end
      end
    end
    
    
    
   
    
  end
  
  def last_90_days
    
  end
  
  def total_this_year
    self.notes.each do |t|
      if t.transaction_type == "Debit"
        @total += t.amount
      end
    end
  end
  
  
end
