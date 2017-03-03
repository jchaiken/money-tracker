class Account < ActiveRecord::Base
  has_many :notes
  has_one :related_account
  scope :cash, -> {where(account_type: 'Cash')}
  scope :bank, -> {where(account_type: 'Bank')}
  scope :credit_card, -> {where(account_type: 'Credit Card')}
  scope :bill, -> {where(account_type: 'Bill')}
  validates :name, presence: true, uniqueness: true
  validates :balance, presence: true
  validates :account_type, presence: true
  validates :due_date, presence: true
  
  def bills_due_total
    self.where(:due_date => (due_date <= Date.today.end_of_month && due_date >= Date.today.beginning_of_month)).sum(:minimum_payment)
  end
end
