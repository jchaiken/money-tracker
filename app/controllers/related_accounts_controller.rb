class RelatedAccountsController < ApplicationController
  before_action :set_related_account, only: [:show, :edit, :update, :destroy]

  # GET /related_accounts
  # GET /related_accounts.json
  def index
    @related_accounts = RelatedAccount.all
  end

  # GET /related_accounts/1
  # GET /related_accounts/1.json
  def show
  end

  # GET /related_accounts/new
  def new
    @related_account = RelatedAccount.new
  end

  # GET /related_accounts/1/edit
  def edit
  end

  # POST /related_accounts
  # POST /related_accounts.json
  def create
    @related_account = RelatedAccount.new(related_account_params)

    respond_to do |format|
      if @related_account.save
        format.html { redirect_to @related_account, notice: 'Related account was successfully created.' }
        format.json { render :show, status: :created, location: @related_account }
      else
        format.html { render :new }
        format.json { render json: @related_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /related_accounts/1
  # PATCH/PUT /related_accounts/1.json
  def update
    respond_to do |format|
      if @related_account.update(related_account_params)
        format.html { redirect_to @related_account, notice: 'Related account was successfully updated.' }
        format.json { render :show, status: :ok, location: @related_account }
      else
        format.html { render :edit }
        format.json { render json: @related_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /related_accounts/1
  # DELETE /related_accounts/1.json
  def destroy
    @related_account.destroy
    respond_to do |format|
      format.html { redirect_to related_accounts_url, notice: 'Related account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_account
      @related_account = RelatedAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def related_account_params
      params.require(:related_account).permit(:name, :account_type, :balance, :due_date, :apr, :principal_balance, :account_id)
    end
end
