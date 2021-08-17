class StudentsController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    #@students = Student.all
    @pagy, @students = pagy(Student.all)
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    #@student = Student.new(student_params)

    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.create(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to teacher_students_path(current_teacher.id ), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to edit_teacher_student_path(current_teacher.id), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_teacher
    @teacher = teacher.find(params[:teacher_id])
  end

  def set_user
    @user = user.find(params[:user_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:id, :email)
    end
end
