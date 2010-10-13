class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

  #roles
  ROLES = [:user, :admin, :manager]

  def role
    ROLES[self.role_mask]
  end

  def role?(role)
    ROLES[self.role_mask] == role.to_sym
  end

  def role=(role)
   self.role_mask = ROLES.map{|r| r == role.to_sym ? ROLES.index : nil }.compact.first  
  end

  def self.has_not_admin?
    self.count == 0
  end

  def admin?
    self.role? :admin
  end

  def has_not_admin?
    !User.where("role_mask = 1").first
  end

  before_create :set_admin_if_first_user

private 
  def set_admin_if_first_user
    if self.role.nil? and User.count ==  0
      self.role = "admin"
    end
  end

end
