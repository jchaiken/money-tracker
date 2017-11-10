class Note < ActiveRecord::Base
    belongs_to :account
    belongs_to :category
    scope :credit, -> {where(transaction_type: 'Credit')}
    scope :debit, -> {where(transaction_type: 'Debit')}
    validates :explanation, presence: true
    validates :amount, presence: true
    validates :transaction_type, presence: true
    validates :account_id, presence: true
    
    def update_note
      self.account_id = self.related_account_id
      self.related_account_id = self.account_id
      if transaction_type == "Credit"
        self.transaction_type = "Debit"
      else
        self.transaction_type = "Credit"
      end
      self.save
    end
    
    
    def process_transaction
      if transaction_type == "Credit"
        self.add_to_account_balance
      else  # transaction type is debit
        self.subtract_from_account_balance
      end
    end
    
    def add_to_account_balance
      # a credit to loan or credit card is subtracted from balance
      if account.account_type == "Loan" || account.account_type == "Credit" # update account balance, due date, and minimum payment
        account.balance -= amount
        self.account.update!(balance: account.balance, due_date: account.due_date.months_since(1))
      elsif account.account_type == "Bill"
        self.account.update!(due_date: account.due_date.months_since(1))
      else # update account balance
        account.balance += amount
        self.account.update!(balance: account.balance)
      end
    end
      
    def subtract_from_account_balance
      unless account.account_type == "Bill"
        if account.account_type == "Credit"
          account.balance += amount
        else
          account.balance -= amount
        end
        self.account.update!(balance: account.balance)
      end
    end
end