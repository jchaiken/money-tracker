class Bill < ActiveRecord::Base
    has_many :transactions
end
