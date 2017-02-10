class RelatedAccount < ActiveRecord::Base
  has_many :transactions
end
