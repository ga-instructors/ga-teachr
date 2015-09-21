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
    @files = @cohort.browse(params[:browse])
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
    authorize @cohort
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)

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
      params.require(:cohort).permit(:campus_id, :course_id, :name, :begins_at, :ends_at, :github_repo)
    end
end
