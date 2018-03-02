class User < ApplicationRecord
  # resourcify
  before_create :assign_default_role
  has_many :tokens, dependent: :destroy
  has_secure_password
  rolify
  
  
  validates :name, presence: true
  validates :last_name, presence: true
  # validates :website, presence: true
  validates :email, presence: true, uniqueness: true

  private

    def assign_default_role
      self.add_role(:beginner) if self.roles.blank?
    end
end
