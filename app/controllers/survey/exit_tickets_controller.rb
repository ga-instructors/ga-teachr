class Survey::ExitTicketsController < Survey::QuestionnairesController
  before_action :set_cohort
  before_action :set_survey_exit_ticket, only: [:show, :edit, :update, :destroy]

  # GET /survey/quizzes
  # GET /survey/quizzes.json
  def index
    @survey_exit_tickets = @survey_questionnaires = policy_scope(@cohort.exit_tickets)
  end

  # GET /survey/quizzes/1
  # GET /survey/quizzes/1.json
  def show
    super
  end

  # GET /survey/quizzes/new
  def new
    @survey_exit_ticket = @survey_questionnaire = @cohort.exit_tickets.new
    authorize @survey_exit_ticket
  end

  # GET /survey/quizzes/1/edit
  def edit
  end

  # POST /survey/quizzes
  # POST /survey/quizzes.json
  def create
    @survey_exit_ticket = @survey_questionnaire = @cohort.exit_tickets.new(survey_exit_ticket_params)
    authorize @survey_exit_ticket

    respond_to do |format|
      if @survey_exit_ticket.save
        format.html { redirect_to @survey_exit_ticket, notice: 'ExitTicket was successfully created.' }
        format.json { render :show, status: :created, location: @survey_exit_ticket }
      else
        format.html { render :new }
        format.json { render json: @survey_exit_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/quizzes/1
  # PATCH/PUT /survey/quizzes/1.json
  def update
    respond_to do |format|
      if @survey_exit_ticket.update(survey_exit_ticket_params)
        format.html { redirect_to @survey_exit_ticket, notice: 'ExitTicket was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_exit_ticket }
      else
        format.html { render :edit }
        format.json { render json: @survey_exit_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/quizzes/1
  # DELETE /survey/quizzes/1.json
  def destroy
    @survey_exit_ticket.destroy
    respond_to do |format|
      format.html { redirect_to survey_exit_tickets_url, notice: 'ExitTicket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      if params[:cohort_id] ||= params[:survey_exit_ticket].try(:[], :cohort_id)
        @cohort = Cohort.find(params[:cohort_id])
      end
    end
  
    def set_survey_exit_ticket
      @survey_exit_ticket = @survey_questionnaire = Survey::ExitTicket.find(params[:id])
      authorize @survey_exit_ticket
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_exit_ticket_params
      params.require(:survey_exit_ticket).permit(:cohort_id, :ordinal, :title, :begins_at, :ends_at, :introduction)
    end
end
