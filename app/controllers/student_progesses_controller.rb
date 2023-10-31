class StudentProgessesController < ApplicationController
  before_action :set_student_progess, only: %i[ show edit update destroy ]

  # GET /student_progesses or /student_progesses.json
  def index
    @student_progesses = StudentProgess.all
  end

  # GET /student_progesses/1 or /student_progesses/1.json
  def show
  end

  # GET /student_progesses/new
  def new
    @student_progess = StudentProgess.new
  end

  # GET /student_progesses/1/edit
  def edit
  end

  # POST /student_progesses or /student_progesses.json
  def create
    @student_progess = StudentProgess.new(student_progess_params)

    respond_to do |format|
      if @student_progess.save
        format.html { redirect_to student_progess_url(@student_progess), notice: "Student progess was successfully created." }
        format.json { render :show, status: :created, location: @student_progess }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_progess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_progesses/1 or /student_progesses/1.json
  def update
    respond_to do |format|
      if @student_progess.update(student_progess_params)
        format.html { redirect_to student_progess_url(@student_progess), notice: "Student progess was successfully updated." }
        format.json { render :show, status: :ok, location: @student_progess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_progess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_progesses/1 or /student_progesses/1.json
  def destroy
    @student_progess.destroy

    respond_to do |format|
      format.html { redirect_to student_progesses_url, notice: "Student progess was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_progess
      @student_progess = StudentProgess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_progess_params
      params.require(:student_progess).permit(:year_id, :semester_id, :student_id, :subject_id)
    end
end
