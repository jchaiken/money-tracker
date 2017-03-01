class RelatedAccount < ActiveRecord::Base
  has_many :notes
  belongs_to :account
  #validates :account_id, presence: true
end
