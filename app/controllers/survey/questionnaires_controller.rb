class Survey::QuestionnairesController < ApplicationController
  before_action :set_cohort
  before_action :set_survey_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /survey/questionnaires
  # GET /survey/questionnaires.json
  def index
    @survey_questionnaires = policy_scope(@cohort ? @cohort.surveys : Survey::Questionnaire.all)
  end

  # GET /survey/questionnaires/1
  # GET /survey/questionnaires/1.json
  def show
    @survey_response = @survey_questionnaire.responses.new(student: current_user.student)
  end

  # GET /survey/questionnaires/new
  def new
    @cohort = current_user.cohort
    @survey_questionnaire = Survey::Questionnaire.new(cohort: @cohort)
    authorize @survey_questionnaire
  end

  # GET /survey/questionnaires/1/edit
  def edit
  end

  # POST /survey/questionnaires
  # POST /survey/questionnaires.json
  def create
    @survey_questionnaire = Survey::Questionnaire.new(survey_questionnaire_params)
    authorize @survey_questionnaire

    respond_to do |format|
      if @survey_questionnaire.save
        format.html { redirect_to @survey_questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @survey_questionnaire }
      else
        format.html { render :new }
        format.json { render json: @survey_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/questionnaires/1
  # PATCH/PUT /survey/questionnaires/1.json
  def update
    respond_to do |format|
      if @survey_questionnaire.update(survey_questionnaire_params)
        format.html { redirect_to survey_questionnaire_questions_path(@survey_questionnaire), notice: 'Survey updated.  Take an opportunity to review the questions.' }
        format.json { render :show, status: :ok, location: @survey_questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @survey_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/questionnaires/1
  # DELETE /survey/questionnaires/1.json
  def destroy
    @survey_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to survey_questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:cohort_id]) if params[:cohort_id]
    end

    def set_survey_questionnaire
      @survey_questionnaire = Survey::Questionnaire.find(params[:id])
      authorize @survey_questionnaire
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_questionnaire_params
      params.require(:survey_questionnaire).permit(:cohort_id, :ordinal, :title, :begins_at, :ends_at, :introduction)
    end
end
