class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    if logged_in?
      @notes = Note.paginate(:page => params[:page], :per_page => 10)
    else
      redirect_to root_path
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    if logged_in?
      @account = Account.find(params[:account_id])
      @note = Note.new
    else
      redirect_to root_path
    end
  end

  # GET /notes/1/edit
  def edit
    if logged_in?
      @account = @note.account
    else
      redirect_to root_path
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    if logged_in?
      @note = Note.create(note_params)
      @account = Account.find(@note.account_id)
        if @note.related_account_id.present?
          @related_account = RelatedAccount.find(@note.related_account_id)
        end
        
      @note.process_transaction
       
        #   if @note.transaction_type == "Credit"
        #     @note.add_to_account_balance
        #     @note.subtract_from_related_balance
        #   elsif @note.transaction_type == "Debit"
        #     @note.subtract_from_account_balance
        #     @note.add_to_related_balance
        #   end
          
        # else
          
        #   if @note.transaction_type == "Credit"
        #     @note.add_to_account_balance
        #   elsif @note.transaction_type == "Debit"
        #     @note.subtract_from_account_balance
          
        #   end
        
      respond_to do |format|
        if @note.save
          format.html { redirect_to @note, notice: 'Note was successfully created.' }
          format.json { render :show, status: :created, location: @note }
        else
          format.html { render :new }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to @note, notice: 'Note was successfully updated.' }
          format.json { render :show, status: :ok, location: @note }
        else
          format.html { render :edit }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    if logged_in?
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: 'note was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      if logged_in?
        @note = Note.find(params[:id])
      else
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:explanation, :amount, :transaction_date, :category_id, :transaction_type, :account_id, :related_account_id)
    end
end
