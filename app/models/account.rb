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
    self.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight)
  end
end
