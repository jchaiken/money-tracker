class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @notes = @category.notes
  end

  
  def new
    @category = Category.new
  end

  
  def edit
  end
  
  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = "Category has been created."
      redirect_to category_path(@category)
    else
      # style these messages --> need option for no errors: Something went wrong...
      flash[:danger] = @category.errors.full_messages
      puts @category.errors.full_messages
      redirect_to request.referrer
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :note_id)
    end
end
