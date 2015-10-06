class CohortsController < ApplicationController

  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = policy_scope(Cohort)
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
    params[:browse] = '/' if params[:browse].blank?
    if current_auth.client
      @files = -> { current_auth.client.contents(@cohort.github_repo, path: params[:browse]) }
      @forks = -> { current_auth.client.forks(@cohort.github_repo) }
      @log = -> { current_auth.client.commits(@cohort.github_repo) }
    end
    respond_to do |format|
      format.html
      format.jpg { redirect_to ActionController::Base.helpers.image_path('cohorts/default-background.jpg') }
      format.json
    end
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new(name: FFaker::Food.ingredient.titleize, course: current_user.cohort.course, campus: current_user.campus, begins_at: Time.now, ends_at: 12.weeks.from_now)
    authorize @cohort
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)
    authorize @cohort

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
      authorize @cohort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:campus_id, :course_id, :banner_x, :banner_y, :banner, :name, :begins_at, :ends_at, :github_repo)
    end
end
