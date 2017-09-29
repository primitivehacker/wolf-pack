class UserStudySessionsController < ApplicationController
  before_action :set_user_study_session, only: [:show, :edit, :update, :destroy]

  # GET /user_study_sessions
  # GET /user_study_sessions.json
  def index
    @user_study_sessions = UserStudySession.all
  end

  # GET /user_study_sessions/1
  # GET /user_study_sessions/1.json
  def show
  end

  # GET /user_study_sessions/new
  def new
    @user_study_session = UserStudySession.new
  end

  # GET /user_study_sessions/1/edit
  def edit
  end

  # POST /user_study_sessions
  # POST /user_study_sessions.json
  def create
    @user_study_session = UserStudySession.new(user_study_session_params)

    respond_to do |format|
      if @user_study_session.save
        format.html { redirect_to @user_study_session, notice: 'User study session was successfully created.' }
        format.json { render :show, status: :created, location: @user_study_session }
      else
        format.html { render :new }
        format.json { render json: @user_study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_study_sessions/1
  # PATCH/PUT /user_study_sessions/1.json
  def update
    respond_to do |format|
      if @user_study_session.update(user_study_session_params)
        format.html { redirect_to @user_study_session, notice: 'User study session was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_study_session }
      else
        format.html { render :edit }
        format.json { render json: @user_study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_study_sessions/1
  # DELETE /user_study_sessions/1.json
  
  def destroy

  @user_study_session.destroy
  
  respond_to do |format|
  
  format.html { redirect_to users_tenant_study_session_url(id: @user_study_session.study_session_id,
  
  tenant_id: @user_study_session.study_session.tenant_id),
  
  notice: 'User was successfully removed from the study session' }
  
  format.json { head :no_content }
  
  end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_study_session
      @user_study_session = UserStudySession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_study_session_params
      params.require(:user_study_session).permit(:study_session_id, :user_id)
    end
end
