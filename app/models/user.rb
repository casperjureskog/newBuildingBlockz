class User < ApplicationRecord
  VALID_ROLES = ['admin', 'janitor', 'tenant', 'user']
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :role, inclusion: {in: VALID_ROLES, message: '%{value} is not a valid user role'}
  has_many :help_requests
  has_many :building
  has_many :bookings

  def admin?
    self.role == 'admin'
  end
  def janitor?
    self.role == 'janitor'
  end
end
