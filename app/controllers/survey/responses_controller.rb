class Survey::ResponsesController < ApplicationController
  before_action :set_survey_response, only: [:show, :edit, :update, :destroy]

  # GET /survey/responses
  # GET /survey/responses.json
  def index
    @survey_responses = policy_scope(Survey::Response.all)
  end

  # GET /survey/responses/1
  # GET /survey/responses/1.json
  def show
  end

  # GET /survey/responses/new
  def new
    @survey_response = Survey::Response.new
    authorize @survey_response
  end

  # GET /survey/responses/1/edit
  def edit
  end

  # POST /survey/responses
  # POST /survey/responses.json
  def create
    @survey_response = Survey::Response.new(survey_response_params)
    @survey_response.student = current_user.student
    authorize @survey_response

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to edit_survey_response_path(@survey_response), notice: 'Good Luck!' }
        format.json { render :show, status: :created, location: @survey_response }
      else
        format.html { render :new }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey/responses/1
  # PATCH/PUT /survey/responses/1.json
  def update
    respond_to do |format|
      if @survey_response.update(survey_response_params)
        format.html { redirect_to @survey_response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response }
      else
        format.html { render :edit }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/responses/1
  # DELETE /survey/responses/1.json
  def destroy
    @survey_response.destroy
    respond_to do |format|
      format.html { redirect_to survey_responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = Survey::Response.find(params[:id])
      authorize @survey_response
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit(:survey_questionnaire_id, :answers_attributes => [:id, :survey_question_id, :survey_question_option_id, :answer])
    end
end
