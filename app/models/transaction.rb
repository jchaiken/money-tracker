class Transaction < ActiveRecord::Base
    belongs_to :bank_account
    belongs_to :cash_account
    belongs_to :credit_card
    belongs_to :bill
    
    
    def credit
      self.cash_account.balance += self.amount
      self.cash_account.update!(balance: self.cash_account.balance)
    end
end
