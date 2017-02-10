class CashAccount < ActiveRecord::Base
    
    validates :name, presence: true
    validates :balance, presence: true
  
end
