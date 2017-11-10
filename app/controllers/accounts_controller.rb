class AccountsController < ApplicationController
  before_action :require_login
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  def index
    @accounts = Account.all
  end

  def show
    @notes = @account.notes
    @notes = @notes.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    
    if @account.save
      flash[:success] = "Account has been created."
      redirect_to account_path(@account)
    else
      # style these messages --> need option for no errors: Something went wrong...
      flash[:danger] = @account.errors.full_messages
      puts @account.errors.full_messages
      redirect_to request.referrer
    end
    
  end

  def update
    
    if @account.update(account_params)
      flash[:success] = "Account has been updated."
      redirect_to account_path(@account)
    else
      flash[:success] = "Something went wrong. Please try again."
      redirect_to request.referrer
    end
  end

  def destroy
    @account.destroy
    
    flash[:success] = "Account has been destroyed."
    redirect_to accounts_path
  end
  
  def cash_accounts
    @accounts = Account.all
    @cash_accounts = @accounts.cash
  end
  
  def bank_accounts
    @accounts = Account.all
    @bank_accounts = @accounts.bank
  end
  
  def credit_cards
    @accounts = Account.all
    @credit_cards = @accounts.credit
    # @total = Account.total_balance
  end
  
  def bills
    @accounts = Account.all
    @bills = @accounts.bill
  end
  
  def loans
    @accounts = Account.all
    @loans = @accounts.loan
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :account_type, :balance, :due_date, :apr, :credit_limit, :minimum_payment, :paid)
    end
end
