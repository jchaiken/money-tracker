class CreditCard < ActiveRecord::Base
    has_many :transactions
end
