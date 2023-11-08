class SemesterSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_semester_subject, only: %i[ show edit update destroy ]

  # GET /semester_subjects or /semester_subjects.json
  def index
    @semester_subjects = SemesterSubject.all
  end

  # GET /semester_subjects/1 or /semester_subjects/1.json
  def show

  end

  # GET /semester_subjects/new
  def new
    @semester_subject = SemesterSubject.new
  end

  # GET /semester_subjects/1/edit
  def edit
  end

  def custom_create
    sub_id = params[:subject_id]
    sem_id = params[:semester_id]
    ss = SemesterSubject.new
    ss.subject_id = sub_id
    ss.semester_id = sem_id
    ss.save
    StudentProgress.select(:user_id).where(semester_id: sem_id).each do |single|
      stud_sub = StudentSubject.new
      stud_sub.subject_id = sub_id
      stud_sub.user_id = single.user_id
      stud_sub.save
    end
    redirect_to :root
  end

  def custom_destroy
    sub_id = params[:subject_id]
    sem_id = params[:semester_id]
    ss = SemesterSubject.where(subject_id: sub_id, semester_id: sem_id)[0]
    ss.destroy
    StudentProgress.select(:user_id).where(semester_id: sem_id).each do |single|
      stud_sub = StudentSubject.where(subject_id: sub_id, user_id: single.user_id)[0]
      stud_sub.destroy
    end
    TeacherSubject.where(subject_id: sub_id).destroy_all
    redirect_to :root
  end

  # POST /semester_subjects or /semester_subjects.json
  def create
    @semester_subject = SemesterSubject.new(semester_subject_params)

    respond_to do |format|
      if @semester_subject.save
        format.html { redirect_to semester_subject_url(@semester_subject), notice: "Semester subject was successfully created." }
        format.json { render :show, status: :created, location: @semester_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @semester_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semester_subjects/1 or /semester_subjects/1.json
  def update
    respond_to do |format|
      if @semester_subject.update(semester_subject_params)
        format.html { redirect_to semester_subject_url(@semester_subject), notice: "Semester subject was successfully updated." }
        format.json { render :show, status: :ok, location: @semester_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @semester_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semester_subjects/1 or /semester_subjects/1.json
  def destroy
    @semester_subject.destroy

    respond_to do |format|
      format.html { redirect_to semester_subjects_url, notice: "Semester subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester_subject
      @semester_subject = SemesterSubject.new
    end

    # Only allow a list of trusted parameters through.
    def semester_subject_params
      params.require(:semester_subject).permit(:semester_id, :subject_id)
    end
end
