class PagesController < ApplicationController
  before_action :set_accounts
  def home
    
  end
  
  private
  
    def set_accounts
      @cash_accounts = Account.cash
      @bank_accounts = Account.bank
      @credit_cards = Account.credit_card
      @bills = Account.bill
    end
  
    def due_this_month
      
    end
end
