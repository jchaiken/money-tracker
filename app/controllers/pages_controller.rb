class PagesController < ApplicationController
  def home
    @cash_accounts = Account.cash
    @bank_accounts = Account.bank
    @credit_cards = Account.credit_card
    @bills = Account.bill
  end
end
