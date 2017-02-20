class Note < ActiveRecord::Base
    belongs_to :account
    belongs_to :related_account
    belongs_to :category
    scope :credit, -> {where(transaction_type: 'Credit')}
    scope :debit, -> {where(transaction_type: 'Debit')}
    validates :explanation, presence: true
    validates :amount, presence: true
    validates :transaction_type, presence: true
    
    
    def add_to_account_balance
      self.account.balance += self.amount
      self.account.update!(balance: self.account.balance)
      self.update_related_account
    end
    
    def add_to_related_balance
      self.related_account.balance += self.amount
      self.related_account.update!(balance: self.related_account.balance)
      self.update_account
    end
      
    def subtract_from_account_balance
      self.account.balance -= self.amount
      self.account.update!(balance: self.account.balance)
      self.update_related_account
    end
    
    def subtract_from_related_balance
      self.related_account.balance -= self.amount
      self.related_account.update!(balance: self.related_account.balance)
      self.update_account
    end
    
    def update_related_account
      @account_id = self.account_id
      @clone = RelatedAccount.find(@account_id)
      @clone.update!(balance: self.account.balance)
    end
    
    def update_account
      @related_account_id = self.related_account_id
      @clone = Account.find(@related_account_id)
      @clone.update!(balance: self.related_account.balance)
    end
end