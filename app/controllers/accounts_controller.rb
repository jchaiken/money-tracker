class AccountsController < ApplicationController
  before_action :require_login
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    @accounts = @accounts.paginate(:page => params[:page], :per_page => 10)
    @related_accounts = RelatedAccount.all
    @related_accounts = @related_accounts.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @related_account = RelatedAccount.find(@account.id)
    @notes = @account.notes + @related_account.notes
    @notes = @notes.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @related_account = RelatedAccount.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @related_account = RelatedAccount.new(account_params)
    respond_to do |format|
      if @account.save && @related_account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    @related_account = RelatedAccount.find(@account.id)
    respond_to do |format|
      if @account.update(account_params) && @related_account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @related_account = RelatedAccount.find(@account.id)
    @related_account.destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    @credit_cards = @accounts.credit_card
  end
  
  def bills
    @accounts = Account.all
    @bills = @accounts.bill + @accounts.credit_card
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :account_type, :balance, :due_date, :apr, :credit_limit, :minimum_payment)
    end
end
