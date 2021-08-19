class AnswerItemsController < ApplicationController
  before_action :set_answer_item, only: %i[ show edit update destroy ]

  # GET /answer_items or /answer_items.json
  def index
    @answer_items = AnswerItem.all
  end

  # GET /answer_items/1 or /answer_items/1.json
  def show
  end

  # GET /answer_items/new
  def new
    @answer_item = AnswerItem.new
  end

  # GET /answer_items/1/edit
  def edit
  end

  # POST /answer_items or /answer_items.json
  def create
    @answer_item = AnswerItem.new(answer_item_params)

    respond_to do |format|
      if @answer_item.save
        format.html { redirect_to @answer_item, notice: "Answer item was successfully created." }
        format.json { render :show, status: :created, location: @answer_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_items/1 or /answer_items/1.json
  def update
    respond_to do |format|
      if @answer_item.update(answer_item_params)
        format.html { redirect_to @answer_item, notice: "Answer item was successfully updated." }
        format.json { render :show, status: :ok, location: @answer_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_items/1 or /answer_items/1.json
  def destroy
    @answer_item.destroy
    respond_to do |format|
      format.html { redirect_to answer_items_url, notice: "Answer item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_item
      @answer_item = AnswerItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_item_params
      params.require(:answer_item).permit(:title, :correct)
    end
end
