class RelatedAccount < ActiveRecord::Base
  has_many :transactions
  belongs_to :account
end
