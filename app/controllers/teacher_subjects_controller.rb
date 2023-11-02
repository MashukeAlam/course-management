class TeacherSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_teacher_subject, only: %i[ show edit update destroy ]

  # GET /teacher_subjects or /teacher_subjects.json
  def index
    @teacher_subjects = TeacherSubject.all
  end

  # GET /teacher_subjects/1 or /teacher_subjects/1.json
  def show
  end

  # GET /teacher_subjects/new
  def new
    @teacher_subject = TeacherSubject.new
  end

  # GET /teacher_subjects/1/edit
  def edit
  end

  # POST /teacher_subjects or /teacher_subjects.json
  def create
    @teacher_subject = TeacherSubject.new(teacher_subject_params)

    respond_to do |format|
      if @teacher_subject.save
        format.html { redirect_to teacher_subject_url(@teacher_subject), notice: "Teacher subject was successfully created." }
        format.json { render :show, status: :created, location: @teacher_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_subjects/1 or /teacher_subjects/1.json
  def update
    respond_to do |format|
      if @teacher_subject.update(teacher_subject_params)
        format.html { redirect_to teacher_subject_url(@teacher_subject), notice: "Teacher subject was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_subjects/1 or /teacher_subjects/1.json
  def destroy
    @teacher_subject.destroy

    respond_to do |format|
      format.html { redirect_to teacher_subjects_url, notice: "Teacher subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_subject
      @teacher_subject = TeacherSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_subject_params
      params.require(:teacher_subject).permit(:user_id, :subject_id)
    end
end
