class CashAccount < ActiveRecord::Base
    has_many :transactions
    accepts_nested_attributes_for :transactions
    validates :name, presence: true
    validates :balance, presence: true
    
    def add_to_balance
       puts "adding to balance"
       puts self.balance
    end
  
end
