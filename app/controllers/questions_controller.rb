class QuestionsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]
  before_action :set_question, only: %i[ show edit update destroy ]

  QUESTIONS_PER_PAGE = 3
  # GET /questions or /questions.json
  def index
    #@questions = Question.all
    @page = params.fetch(:page, 0).to_i
    @questions = Question.offset(@page*QUESTIONS_PER_PAGE).limit(QUESTIONS_PER_PAGE)
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    #@teacher = Teacher.find(params[:teacher_id])
    @test = Test.find(params[:test_id])
    @question = @test.question.create(question_params)  
    respond_to do |format|
      puts @question.inspect
      if @question.save
        format.html { redirect_to teacher_test_path(current_teacher.id, :id), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end

    
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :question_id)
    end

    def initialize_search
      @question = Question.order(question: :desc)
      session[:question] ||= params[:question]
      session[:filter] = params[:filter]
      params[:filter_option] = nil if params[:filter_option] == ""
      session[:filter_option] = params[:filter_option]
    end
  
    def handle_search_name
      if session[:question]
        @question = Question.where("question LIKE ?", "%#{session[:question]}%")
      else
        @question = Question.all
      end
    end
end
