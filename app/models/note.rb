class Note < ActiveRecord::Base
    belongs_to :account
    belongs_to :related_account
    belongs_to :category
    scope :credit, -> {where(transaction_type: 'Credit')}
    scope :debit, -> {where(transaction_type: 'Debit')}
    validates :explanation, presence: true
    validates :amount, presence: true
    validates :transaction_type, presence: true
    validates :account_id, presence: true
    
    
    def process_transaction
      
      if transaction_type == "Credit"
        self.add_to_account_balance
        if related_account.present?
          self.subtract_from_related_balance
        end
      else  # transaction type is debit
        self.subtract_from_account_balance
        if related_account.present?
          self.add_to_related_balance
        end
      end
    
    end
    
    def add_to_account_balance
      # add note amount to account balance and change due date if paying bill
      self.account.balance += self.amount
      self.account.due_date = self.account.due_date.months_since(1)
      # update account balance and due date
      self.account.update!(balance: self.account.balance, due_date: self.account.due_date)
      # update clone account
      self.update_clone_related_account
    end
    
    def add_to_related_balance
      self.related_account.balance += self.amount
      self.related_account.due_date = self.related_account.due_date.months_since(1)
      self.related_account.update!(balance: self.related_account.balance, due_date: self.account.due_date)
      self.update_clone_account
    end
      
    def subtract_from_account_balance
      self.account.balance -= self.amount
      self.account.update!(balance: self.account.balance)
      self.update_clone_related_account
    end
    
    def subtract_from_related_balance
      self.related_account.balance -= self.amount
      self.related_account.update!(balance: self.related_account.balance)
      self.update_clone_account
    end
    
    def update_clone_related_account
      @account_id = self.account_id
      @clone = RelatedAccount.find(@account_id)
      @clone.update!(balance: self.account.balance)
    end
    
    def update_clone_account
      @related_account_id = self.related_account_id
      @clone = Account.find(@related_account_id)
      @clone.update!(balance: self.related_account.balance)
    end
end