class StudySession < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :title

    validate :free_plan_can_only_have_one_study_session
    
    def free_plan_can_only_have_one_study_session
    
    if self.new_record? && (tenant.study_sessions.count > 0) && (tenant.plan == 'free')
    
    errors.add(:base, "Free plans cannot have more than one Study Session")
    
    end
    
    end
    
    
    def self.by_plan_and_tenant(tenant_id)

    tenant = Tenant.find(tenant_id)
    
    if tenant.plan == 'premium'
    
    tenant.study_sessions
    
    else
    
    tenant.study_sessions.order(:id).limit(1)
    
    end
    
    end
end
