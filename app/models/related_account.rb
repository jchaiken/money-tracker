class RelatedAccount < ActiveRecord::Base
  has_many :notes
  belongs_to :account
end
