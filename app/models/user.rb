class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_universal_and_determines_account
  has_one :member
  has_many :members, :dependent => :destroy
  
  has_one :payment
  has_many :user_study_sessions
  has_many :study_sessions, through: :user_study_sessions
  



  accepts_nested_attributes_for :payment
  
  def is_admin?

  is_admin
  
  end

    
    
end
