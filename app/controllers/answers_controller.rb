class AnswersController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_answer, only: %i[ show edit update destroy ]

  ANSWERS_PER_PAGE = 3
  # GET /answers or /answers.json
  def index
    #@answers = Answer.all
    @page = params.fetch(:page, 0).to_i
    @answers = Answer.offset(@page*ANSWERS_PER_PAGE).limit(ANSWERS_PER_PAGE)
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
    #@answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to teacher_test_path(current_teacher.id, :id), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question ||= Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer)
    end

    

    def initialize_search
      @answer = Answer.order(answer: :desc)
      session[:answer] ||= params[:answer]
      session[:filter] = params[:filter]
      params[:filter_option] = nil if params[:filter_option] == ""
      session[:filter_option] = params[:filter_option]
    end
  
    def handle_search_name
      if session[:answer]
        @answer = Answer.where("answer LIKE ?", "%#{session[:answer]}%")
      else
        @answer = Answer.all
      end
    end
end
