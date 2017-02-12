class Account < ActiveRecord::Base
  has_many :transactions
  has_one :related_account
  scope :cash, -> {where(account_type: 'Cash')}
  scope :bank, -> {where(account_type: 'Bank')}
  scope :credit_card, -> {where(account_type: 'Credit Card')}
  scope :bill, -> {where(account_type: 'Bill')}
  validates :name, presence: true, uniqueness: true
  validates :balance, presence: true
  validates :account_type, presence: true
end
