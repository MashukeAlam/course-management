class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  def approve
    @request = Request.find(params[:id])
    @request.approved = true
    @request.save
    @role = Role.new
    @role.user = User.find(@request.user_id)
    @role.role = @request.role
    @role.save
    @user = User.find(@request.user_id)
    @user.role = @request.role
    @user.save
    redirect_to :root
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request), notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:role, :user_id)
    end
end
