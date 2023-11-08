class StudentSubjectsController < ApplicationController
  before_action :set_student_subject, only: %i[ show edit update destroy ]

  # GET /student_subjects or /student_subjects.json
  def index
    @student_subjects = StudentSubject.all
  end

  # GET /student_subjects/1 or /student_subjects/1.json
  def show
  end

  # GET /student_subjects/new
  def new
    @student_subject = StudentSubject.new
  end

  # GET /student_subjects/1/edit
  def edit
  end

  # POST /student_subjects or /student_subjects.json
  def create
    @student_subject = StudentSubject.new(student_subject_params)

    respond_to do |format|
      if @student_subject.save
        format.html { redirect_to student_subject_url(@student_subject), notice: "Student subject was successfully created." }
        format.json { render :show, status: :created, location: @student_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_subjects/1 or /student_subjects/1.json
  def update
    puts "<<<<< HERE >>>>>"
    @student_subject = StudentSubject.find(params[:id])
    puts "<<<<<<<<<<", @student_subject.id, "<<<<<<<<<<<<<<<<<<"
    puts student_subject_params
    respond_to do |format|
      if @student_subject.update(student_subject_params)
        format.html { redirect_to student_subject_url(@student_subject), notice: "Student subject was successfully updated." }
        format.json { render :show, status: :ok, location: @student_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_subjects/1 or /student_subjects/1.json
  def destroy
    @student_subject.destroy

    respond_to do |format|
      format.html { redirect_to student_subjects_url, notice: "Student subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_subject
      @student_subject = StudentSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_subject_params
      params.require(:student_subject).permit(:user_id, :subject_id)
    end
end
