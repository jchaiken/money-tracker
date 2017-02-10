class Account < ActiveRecord::Base
  has_many :transactions
  scope :cash, -> {where(account_type: 'Cash')}
  scope :bank, -> {where(account_type: 'Bank')}
  scope :credit_card, -> {where(account_type: 'Credit Card')}
  scope :bill, -> {where(account_type: 'Bill')}
  validates :name, presence: true
  validates :balance, presence: true
  validates :account_type, presence: true
end
