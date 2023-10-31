class StudentProgressesController < ApplicationController
  load_and_authorize_resource
  before_action :set_student_progess, only: %i[ show edit update destroy ]

  # GET /student_progesses or /student_progesses.json
  def index
    @student_progresses = StudentProgress.all
  end

  # GET /student_progesses/1 or /student_progesses/1.json
  def show
  end

  # GET /student_progesses/new
  def new
    @student_progress = StudentProgress.new
  end

  # GET /student_progesses/1/edit
  def edit
  end

  # POST /student_progesses or /student_progesses.json
  def create
    @student_progress = StudentProgress.new(student_progess_params)

    respond_to do |format|
      if @student_progress.save
        format.html { redirect_to student_progess_url(@student_progress), notice: "Student progess was successfully created." }
        format.json { render :show, status: :created, location: @student_progress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_progesses/1 or /student_progesses/1.json
  def update
    respond_to do |format|
      if @student_progress.update(student_progess_params)
        format.html { redirect_to student_progess_url(@student_progress), notice: "Student progess was successfully updated." }
        format.json { render :show, status: :ok, location: @student_progress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_progesses/1 or /student_progesses/1.json
  def destroy
    @student_progress.destroy

    respond_to do |format|
      format.html { redirect_to student_progesses_url, notice: "Student progess was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_progess
      @student_progress = StudentProgress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_progess_params
      params.require(:student_progress).permit(:year_id, :semester_id, :student_id, :subject_id)
    end
end
