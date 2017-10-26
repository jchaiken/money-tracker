class Account < ActiveRecord::Base
  has_many :notes
  has_many :categories, through: :notes
  has_one :related_account
  scope :cash, -> {where(account_type: 'Cash')}
  scope :bank, -> {where(account_type: 'Bank')}
  scope :credit_card, -> {where(account_type: 'Credit Card')}
  scope :bill, -> {where(account_type: 'Bill')}
  validates :name, presence: true, uniqueness: true
  validates :balance, presence: true
  validates :account_type, presence: true
  validates :due_date, presence: true unless Proc.new { |account| account.account_type == "Bank" }
  
  def bills_due_total
    self.where(:due_date => (Date.today.beginning_of_month + 1...Date.today.end_of_month)).sum(:minimum_payment)
  end
  
  def due_this_month
    Account.where({ due_date: Date.today.beginning_of_month...Date.today.end_of_month, account_type: ["Bill", "Credit Card"] }).sum(:minimum_payment)
  end
  
  def credit_ratio
    if credit_limit.present?
      unless credit_limit == 0
        balance/credit_limit*100
      end
    end
  end
  
  def total_balance
    self.where('account_type = ? AND balance = ?', "Credit Card", true).sum(:balance)
    #sum(:balance) if balance.present? && account_type == "Credit Card"
  end
  
  def total_limit
    sum(:credit_limit) if credit_limit.present? && account_type == "Credit Card"
  end
  
  def total_ratio
    self.total_balance/self.total_limit*100 unless self.total_limit == 0
  end
  
end
