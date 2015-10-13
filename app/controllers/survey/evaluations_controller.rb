class Survey::EvaluationsController < ApplicationController
  before_action :set_survey_questionnaire
  before_action :set_survey_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /survey/evaluations
  # GET /survey/evaluations.json
  def index
    @survey_evaluations = policy_scope(Survey::Evaluation.all)
  end

  # GET /survey/evaluations/1
  # GET /survey/evaluations/1.json
  def show
  end

  # GET /survey/evaluations/new
  def new
    @survey_evaluation = Survey::Evaluation.new
    authorize @survey_evaluation
  end

  # GET /survey/evaluations/1/edit
  def edit
  end

  # POST /survey/evaluations
  # POST /survey/evaluations.json
  def create
    @survey_evaluation = Survey::Evaluation.new(survey_evaluation_params)
    authorize @survey_evaluation

    respond_to do |format|
      if @survey_evaluation.save
        format.html { redirect_to @survey_evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @survey_evaluation }
      else
        format.html { render :new }
        format.json { render json: @survey_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/evaluations/1
  # PATCH/PUT /survey/evaluations/1.json
  def update
    respond_to do |format|
      if @survey_evaluation.update(survey_evaluation_params)
        format.html { redirect_to @survey_evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @survey_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/evaluations/1
  # DELETE /survey/evaluations/1.json
  def destroy
    @survey_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to survey_evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_questionnaire
      @survey_questionnaire = Survey::Questionnaire.find(params[:questionnaire_id])
    end

    def set_survey_evaluation
      @survey_evaluation = @survey_questionnaire.evaluations.find(params[:id])
      authorize @survey_evaluation
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_evaluation_params
      params.require(:survey_evaluation).permit(:survey_response_id, :survey_question_id, :student_id, :employee_id, :value, :manifest)
    end
end
