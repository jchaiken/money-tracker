class Transaction < ActiveRecord::Base
    belongs_to :account
    belongs_to :related_account
    scope :credit, -> {where(transaction_type: 'Credit')}
    scope :debit, -> {where(transaction_type: 'Debit')}
    validates :explanation, presence: true
    validates :amount, presence: true
    validates :transaction_type, presence: true
    
    
    def add_to_account_balance
      self.account.balance += self.amount
      self.account.update!(balance: self.account.balance)
    end
    
    def add_to_related_balance
      self.related_account.balance += self.amount
      self.related_account.update!(balance: self.related_account.balance)
    end
      
    def subtract_from_account_balance
      self.account.balance -= self.amount
      self.account.update!(balance: self.account.balance)
    end
    
    def subtract_from_related_balance
      self.related_account.balance -= self.amount
      self.related_account.update!(balance: self.related_account.balance)
    end
end