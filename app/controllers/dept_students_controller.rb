class DeptStudentsController < ApplicationController
  before_action :set_dept_student, only: %i[ show edit update destroy ]

  # GET /dept_students or /dept_students.json
  def index
    @dept_students = DeptStudent.all
  end

  # GET /dept_students/1 or /dept_students/1.json
  def show
  end

  # GET /dept_students/new
  def new
    @dept_student = DeptStudent.new
    @user_id = params[:user_id]
  end

  # GET /dept_students/1/edit
  def edit
  end

  # POST /dept_students or /dept_students.json
  def create
    @dept_student = DeptStudent.new(dept_student_params)

    respond_to do |format|
      if @dept_student.save
        format.html { redirect_to dept_student_url(@dept_student), notice: "Dept student was successfully created." }
        format.json { render :show, status: :created, location: @dept_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dept_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dept_students/1 or /dept_students/1.json
  def update
    respond_to do |format|
      if @dept_student.update(dept_student_params)
        format.html { redirect_to dept_student_url(@dept_student), notice: "Dept student was successfully updated." }
        format.json { render :show, status: :ok, location: @dept_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dept_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dept_students/1 or /dept_students/1.json
  def destroy
    @dept_student.destroy

    respond_to do |format|
      format.html { redirect_to dept_students_url, notice: "Dept student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dept_student
      @dept_student = DeptStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dept_student_params
      params.require(:dept_student).permit(:department_id, :user_id)
    end
end
