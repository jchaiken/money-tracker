class PagesController < ApplicationController
  before_action :require_login
  before_action :set_accounts
  
  def home
    @bills_due = due_this_month
  end
  
  def budget
    @categories = Category.all
  end
  
  def summary
    @total = bill_totals
  end
  
  
  
  private
  
    def set_accounts
      @cash_accounts = Account.cash.sum(:balance)
      @bank_accounts = Account.bank.sum(:balance)
      @credit_cards = Account.credit.sum(:balance)
    end
    
    def bill_totals
      @bills = Account.bill.sum(:minimum_payment)
      @loans = Account.loan.sum(:minimum_payment)
      @credit_cards = Account.credit.sum(:minimum_payment)
      return @bills + @loans + @credit_cards
    end
  
    def due_this_month
      Account.where({ due_date: Date.today.beginning_of_month...Date.today.end_of_month, account_type: ["Bill", "Credit"] }).sum(:minimum_payment)
    end
end
