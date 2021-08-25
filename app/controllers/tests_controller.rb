class TestsController < ApplicationController
  include Pagy::Backend
  before_action :set_test, only: %i[ show edit update destroy ]
  #@tests = Test.new(params[:test_id])
  # GET /tests or /tests.json
  def index
    #@tests = Test.all
    @pagy, @tests = pagy(Test.all)
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @test.question.build
  end

  # GET /tests/1/edit
  def edit
  end


  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)
    #@test.user_id = current_user.id
    
    respond_to do |format|
      if @test.save
        format.html { redirect_to  teacher_tests_path(current_teacher.id), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:title, :status, :due_date, :description, question_attributes: [:id, :question])
    end

     def initialize_search
      @tests = Test.order(title: :desc)
      session[:title] ||= params[:title]
      session[:filter] = params[:filter]
      params[:filter_option] = nil if params[:filter_option] == ""
      session[:filter_option] = params[:filter_option]
    end
  
    def handle_search_name
      if session[:title]
        @tests = Test.where("title LIKE ?", "%#{session[:title]}%")
      else
        @tests = Test.all
      end
    end

end
