class User < ActiveRecord::Base

	has_secure_password

  ROLELIST = [
    ADMIN = 'Admin',
  ]

  def admin?
    self.role == 'admin'
  end

end
