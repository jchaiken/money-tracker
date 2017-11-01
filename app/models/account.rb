class Account < ActiveRecord::Base
  has_many :notes
  has_many :categories, through: :notes
  scope :cash, -> {where(account_type: 'Cash')}
  scope :bank, -> {where(account_type: 'Bank')}
  scope :credit, -> {where(account_type: 'Credit')}
  scope :loan, -> {where(account_type: 'Loan')}
  scope :bill, -> {where(account_type: 'Bill')}
  validates :name, presence: true, uniqueness: true
  validates :account_type, presence: true
  # require balance unless it's a bill
  validates :balance, presence: true, unless: Proc.new { |account| account.account_type == "Bill" }
  # require due date unless it's a bank or cash account
  validates :due_date, presence: true, unless: Proc.new { |account| account.account_type == "Bank" || account.account_type == "Cash" }
  # require minimum payment unless it's a bank or cash account
  validates :minimum_payment, presence: true, unless: Proc.new { |account| account.account_type == "Bank"  || account.account_type == "Cash" }
  # require credit limit for credit accounts
  validates :credit_limit, presence: true, if: Proc.new { |account| account.account_type == "Credit" || account.account_type == "Loan" }
  
  def bills_due_total
    self.where(:due_date => (Date.today.beginning_of_month + 1...Date.today.end_of_month)).sum(:minimum_payment)
  end
  
  def due_this_month
    Account.where({ due_date: Date.today.beginning_of_month...Date.today.end_of_month, account_type: ["Bill", "Credit"] }).sum(:minimum_payment)
  end
  
  def credit_ratio
    if credit_limit.present?
      if credit_limit == 0
        0
      else
        balance/credit_limit*100
      end
    end
  end
  
  def total_balance
    self.where('account_type = ? AND balance = ?', "Credit", true).sum(:balance)
    #sum(:balance) if balance.present? && account_type == "Credit Card"
  end
  
  def total_limit
    sum(:credit_limit) if credit_limit.present? && account_type == "Credit"
  end
  
  def total_ratio
    self.total_balance/self.total_limit*100 unless self.total_limit == 0
  end
  
end
