class Survey::QuestionsController < ApplicationController
  before_action :set_questionnaire
  before_action :set_survey_question, only: [:show, :edit, :update, :destroy]

  # GET /survey/questions
  # GET /survey/questions.json
  def index
    @survey_questions = policy_scope(@questionnaire.questions)
  end

  # GET /survey/questions/1
  # GET /survey/questions/1.json
  def show
    @next_question = @questionnaire.questions.where('ordinal > ?', @survey_question.ordinal).first
    @previous_question = @questionnaire.questions.where('ordinal < ?', @survey_question.ordinal).last
    @answers = @survey_question.answers.select("survey_answers.*, survey_evaluations.value").joins(:evaluations).order('survey_evaluations.value ASC')
  end

  # GET /survey/questions/new
  def new
    @survey_question = Survey::Question.new
    @survey_question.options.build
    authorize @survey_question
  end

  # GET /survey/questions/1/edit
  def edit
    @survey_question.options.build
  end

  # POST /survey/questions
  # POST /survey/questions.json
  def create
    @survey_question = Survey::Question.new(survey_question_params)
    authorize @survey_question

    respond_to do |format|
      if @survey_question.save
        format.html { redirect_to @survey_question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @survey_question }
      else
        format.html { render :new }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/questions/1
  # PATCH/PUT /survey/questions/1.json
  def update
    respond_to do |format|
      if @survey_question.update(survey_question_params)
        format.html { redirect_to survey_questionnaire_questions_path(@survey_question.questionnaire), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_question }
      else
        format.html { render :edit }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/questions/1
  # DELETE /survey/questions/1.json
  def destroy
    @survey_question.destroy
    respond_to do |format|
      format.html { redirect_to survey_questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Survey::Questionnaire.find(params[:questionnaire_id]) if params[:questionnaire_id]
    end

    def set_survey_question
      if @questionnaire
        @survey_question = @questionnaire.questions.find(params[:id])
      else
        @survey_question = Survey::Question.find(params[:id])
        @questionnaire = @survey_question.questionnaire
      end
      authorize @survey_question
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_params
      params.require(:survey_question).permit(:survey_questionnaire_id, :ordinal, :topics, :prompt, :open_ended, :format, :evaluation, options_attributes: [:id, :label, :value, :_destroy])
    end
end
