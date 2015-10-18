class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    authorize Authentication, :index?
    @authentications = policy_scope(Authentication)
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
  end

  # GET /authentications/new
  def new
    @authentication = Authentication.new
    authorize @authentication
  end

  # GET /authentications/1/edit
  def edit
  end

  # POST /authentications
  # POST /authentications.json
  def create
    @authentication = Authentication.new(authentication_params)
    @authentication.request = request
    authorize @authentication, :create?

    respond_to do |format|
      if @authentication.save
        session[:tk] = @authentication.token
        session[:tz] = @authentication.timezone.name
        format.html { redirect_to authentication_url(@authentication), notice: 'Welcome Back!' }
        format.json { render :show, status: :created, location: @authentication }
      else
        format.html { render :new }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authentications/1
  # PATCH/PUT /authentications/1.json
  def update
    respond_to do |format|
      if @authentication.update(authentication_params)
        format.html { redirect_to authentication_url(@authentication), notice: 'Authentication was successfully updated.' }
        format.json { render :show, status: :ok, location: @authentication }
      else
        format.html { render :edit }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to new_authentication_url, notice: 'You have logged out' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
      authorize @authentication
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      if params[:provider]
        params.permit(:provider, :error, :error_description, :state)
      else
        params.require(:authentication).permit(:type, :user_email, :password)
      end
    end
end
