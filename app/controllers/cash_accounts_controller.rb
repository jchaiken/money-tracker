class CashAccountsController < ApplicationController
  before_action :set_cash_account, only: [:show, :edit, :update, :destroy]

  # GET /cash_accounts
  # GET /cash_accounts.json
  def index
    @cash_accounts = CashAccount.all
  end

  # GET /cash_accounts/1
  # GET /cash_accounts/1.json
  def show
  end

  # GET /cash_accounts/new
  def new
    @cash_account = CashAccount.new
  end

  # GET /cash_accounts/1/edit
  def edit
  end

  # POST /cash_accounts
  # POST /cash_accounts.json
  def create
    @cash_account = CashAccount.new(cash_account_params)

    respond_to do |format|
      if @cash_account.save
        format.html { redirect_to @cash_account, notice: 'Cash account was successfully created.' }
        format.json { render :show, status: :created, location: @cash_account }
      else
        format.html { render :new }
        format.json { render json: @cash_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_accounts/1
  # PATCH/PUT /cash_accounts/1.json
  def update
    respond_to do |format|
      if @cash_account.update(cash_account_params)
        format.html { redirect_to @cash_account, notice: 'Cash account was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_account }
      else
        format.html { render :edit }
        format.json { render json: @cash_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_accounts/1
  # DELETE /cash_accounts/1.json
  def destroy
    @cash_account.destroy
    respond_to do |format|
      format.html { redirect_to cash_accounts_url, notice: 'Cash account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_account
      @cash_account = CashAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_account_params
      params.require(:cash_account).permit(:name, :balance)
    end
end
