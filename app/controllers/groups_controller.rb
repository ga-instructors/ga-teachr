class GroupsController < ApplicationController
  before_action :set_cohort
  before_action :set_groups_grouping, only: [:show, :edit, :update, :destroy]

  # GET /groups/groupings
  # GET /groups/groupings.json
  def index
    @groups_groupings = policy_scope(@cohort.groupings)
  end

  # GET /groups/groupings/1
  # GET /groups/groupings/1.json
  def show
  end

  # GET /groups/groupings/new
  def new
    @groups_grouping = @cohort.groupings.new(params[:groups_grouping] ? groups_grouping_params : {})
    @groups_grouping.populate! { by_quiz_performance.includes(:user) }
    authorize @groups_grouping
  end

  # GET /groups/groupings/1/edit
  def edit
  end

  # POST /groups/groupings
  # POST /groups/groupings.json
  def create
    @groups_grouping = @cohort.groupings.new(groups_grouping_params)
    authorize @groups_grouping

    respond_to do |format|
      if @groups_grouping.save
        format.html { redirect_to cohort_group_path(@cohort, @groups_grouping), notice: 'Grouping was successfully created.' }
        format.json { render :show, status: :created, location: @groups_grouping }
      else
        format.html { render :new }
        format.json { render json: @groups_grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/groupings/1
  # PATCH/PUT /groups/groupings/1.json
  def update
    respond_to do |format|
      if @groups_grouping.update(groups_grouping_params)
        format.html { redirect_to cohort_groups_path(@cohort, @groups_grouping), notice: 'Grouping was successfully updated.' }
        format.json { render :show, status: :ok, location: @groups_grouping }
      else
        format.html { render :edit }
        format.json { render json: @groups_grouping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/groupings/1
  # DELETE /groups/groupings/1.json
  def destroy
    @groups_grouping.destroy
    respond_to do |format|
      format.html { redirect_to groups_groupings_url, notice: 'Grouping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    def set_groups_grouping
      @groups_grouping = @cohort.groupings.find(params[:id])
      authorize @groups_grouping
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groups_grouping_params
      params.require(:groups_grouping).permit(:name, :target_group_count, :target_group_size, :groups_attributes => [:id, :name, assignments_attributes: [:id, :groups_group_id, :student_id, :_destroy]])
    end
end
