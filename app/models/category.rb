class Category < ActiveRecord::Base
  has_many :notes
  validates :name, presence: true, uniqueness: true
  
  def totals
    self.notes.where('transaction_type = ?', "Debit").sum(:amount)
  end
  
  def this_months_totals
    month_start = Date.today.beginning_of_month
    month_end = Date.today.end_of_month
    self.notes.where('transaction_type = ? AND transaction_date >= ? AND transaction_date <= ?', "Debit", month_start, month_end).sum(:amount)
  end
  
  def budget_used
    month_total = self.this_months_totals
    if month_total == 0
      0
    else 
      month_total/self.budget_amount*100
    end
  end
  
  def last_90_days
    
  end
  
  # def total_this_year
  #   self.notes.each do |t|
  #     if t.transaction_type == "Debit"
  #       @total += t.amount
  #     end
  #   end
  # end
  
  
end
