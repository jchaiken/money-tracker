class Transaction < ActiveRecord::Base
    belongs_to :bank_account
    belongs_to :cash_account
    belongs_to :credit_card
    belongs_to :bill
end
