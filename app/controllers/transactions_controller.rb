class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new
    
    
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.create(transaction_params)
    if @transaction.account_id.present? 
      @account = Account.find(@transaction.account_id)
      if @transaction.related_account_id.present?
        @related_account = RelatedAccount.find(@transaction.related_account_id)
        if @transaction.transaction_type == "Credit"
          @transaction.add_to_account_balance
          @transaction.subtract_from_related_balance
        elsif @transaction.transaction_type == "Debit"
          @transaction.subtract_from_account_balance
          @transaction.add_to_related_balance
        end
      else
        if @transaction.transaction_type == "Credit"
          @transaction.add_to_account_balance
        elsif @transaction.transaction_type == "Debit"
          @transaction.subtract_from_account_balance
        end
      end
    end
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:explanation, :amount, :transaction_date, :category, :transaction_type, :account_id, :related_account_id)
    end
end
