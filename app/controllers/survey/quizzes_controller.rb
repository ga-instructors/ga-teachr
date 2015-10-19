class Survey::QuizzesController < Survey::QuestionnairesController
  before_action :set_survey_quiz, only: [:show, :edit, :update, :destroy]

  # GET /survey/quizzes
  # GET /survey/quizzes.json
  def index
    @survey_quizzes = @survey_questionnaires = policy_scope(@cohort.quizzes)
  end

  # GET /survey/quizzes/1
  # GET /survey/quizzes/1.json
  def show
    super
  end

  # GET /survey/quizzes/new
  def new
    @survey_quiz = @survey_questionnaire = @cohort.quizzes.new
    authorize @survey_quiz
  end

  # GET /survey/quizzes/1/edit
  def edit
  end

  # POST /survey/quizzes
  # POST /survey/quizzes.json
  def create
    @survey_quiz = Survey::Quiz.new(survey_quiz_params)
    authorize @survey_quiz

    respond_to do |format|
      if @survey_quiz.save
        format.html { redirect_to [:new, @survey_quiz, :question], notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @survey_quiz }
      else
        format.html { render :new }
        format.json { render json: @survey_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/quizzes/1
  # PATCH/PUT /survey/quizzes/1.json
  def update
    respond_to do |format|
      if @survey_quiz.update(survey_quiz_params)
        format.html { redirect_to @survey_quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_quiz }
      else
        format.html { render :edit }
        format.json { render json: @survey_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/quizzes/1
  # DELETE /survey/quizzes/1.json
  def destroy
    @survey_quiz.destroy
    respond_to do |format|
      format.html { redirect_to survey_quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_quiz
      @survey_quiz = @survey_questionnaire = Survey::Quiz.find(params[:id])
      authorize @survey_quiz
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_quiz_params
      params.require(:survey_quiz).permit(:cohort_id, :ordinal, :title, :begins_at, :ends_at, :introduction)
    end
end
