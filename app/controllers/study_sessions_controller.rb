class StudySessionsController < ApplicationController
  before_action :set_study_session, only: [:show, :edit, :update, :destroy, :users, :add_user]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create, :users, :add_user]
  before_action :verify_tenant

  # GET /study_sessions
  # GET /study_sessions.json
  def index
    #@study_sessions = StudySession.all
    @study_sessions = StudySession.by_user_plan_and_tenant(params[:tenant_id], current_user)
  end

  # GET /study_sessions/1
  # GET /study_sessions/1.json
  def show
    @study_session
  end

  # GET /study_sessions/new
  def new
    @study_session = StudySession.new
    
  end

  # GET /study_sessions/1/edit
  def edit
  end

  # POST /study_sessions
  # POST /study_sessions.json
  def create
    @study_session = StudySession.new(study_session_params)
    @study_session.users << current_user

    respond_to do |format|
      if @study_session.save
        format.html { redirect_to root_url, notice: 'Study session was successfully created.' }
      
      else
        format.html { render :new }
      
      end
    end
  end

  # PATCH/PUT /study_sessions/1
  # PATCH/PUT /study_sessions/1.json
  def update
    respond_to do |format|
      if @study_session.update(study_session_params)
        format.html { redirect_to root_url, notice: 'Study session was successfully updated.' }
    
      else
        format.html { render :edit }
   
      end
    end
  end

  # DELETE /study_sessions/1
  # DELETE /study_sessions/1.json
  def destroy
    @study_session.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Study session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def users

  @study_session_users = (@study_session.users + (User.where(tenant_id: @tenant.id, is_admin: true))) - [current_user]
  
  @other_users = @tenant.users.where(is_admin: false) - (@study_session_users + [current_user])
  
  end


  
  def add_user
  
  @study_session_user = Userstudy_session.new(user_id: params[:user_id], study_session_id: @study_session.id)
  
  respond_to do |format|
  
  if @study_session_user.save
  
  format.html { redirect_to users_tenant_study_session_url(id: @study_session.id,
  
  tenant_id: @study_session.tenant_id),
  
  notice: 'User was successfully added to study_session' }
  
  else
  
  format.html { redirect_to users_tenant_study_session_url(id: @study_session.id,
  
  tenant_id: @study_session.tenant_id),
  
  error: 'User was not added to study_session' }
  
  end
  
  end
  
  end



    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_session
      @study_session = StudySession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_session_params
      params.require(:study_session).permit(:title, :room_number, :date, :time, :tenant_id)
    end
    
    def set_tenant

    @tenant = Tenant.find(params[:tenant_id])
    
    end
    
    def verify_tenant
    
    unless params[:tenant_id] == Tenant.current_tenant_id.to_s
    
    redirect_to :root,
    
    flash: { error: 'You are not authorized to access any organization other than your own'}
    
    end
    
    end
end
