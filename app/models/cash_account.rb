class CashAccount < ActiveRecord::Base
    has_many :transactions
end
