class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable
  def super_admin?
    true if self.role.eql? 'super_admin'
  end

  def member?
    true if self.role.eql? 'member'
  end
  
  def admin?
    true if self.role.eql? 'admin'
  end
end
