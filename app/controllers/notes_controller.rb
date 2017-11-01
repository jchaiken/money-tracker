class NotesController < ApplicationController
  before_action :require_login
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
    @cash_accounts = Account.cash
    @bank_accounts = Account.bank
    @credit_cards = Account.credit
    @bills = Account.bill + Account.loan + Account.credit
  end

  def show
  end

  def new
    @account = Account.find(params[:account_id])
    @note = Note.new
    @categories = Category.all
    @related_accounts = Account.all
    @transaction_type = params[:transaction_type] if params[:transaction_type].present?
  end

  def edit
    @account = @note.account
    @categories = Category.all
    @related_accounts = Account.all
  end

  def create
    @note = Note.create(note_params)
    @account = Account.find(@note.account_id)
    if @note.related_account_id.present?
      @related_account = Account.find(@note.related_account_id)
      # create related note by cloning info
      @related_note = Note.create(note_params)
      # update new note with opposite transaction type and account/related account ids
      @related_note.update_note
      @related_note.process_transaction
      
    end
    @note.process_transaction
    
    if @note.save
      flash[:success] = "Transaction has been created."
      redirect_to account_path(@account)
    else
      flash[:danger] = @note.errors.full_messages
      puts @note.errors.full_messages
      redirect_to request.referrer
    end
    
  end

  def update
    
    if @note.update(note_params)
      flash[:success] = "Transaction has been updated."
      redirect_to account_path(@account)
    else
      flash[:danger] = @note.errors.full_messages
      puts @note.errors.full_messages
      redirect_to request.referrer
    end
    
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:explanation, :amount, :transaction_date, :category_id, :transaction_type, :account_id, :related_account_id)
    end
end
