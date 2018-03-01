class User < ApplicationRecord
  after_create :assign_default_role
  rolify
  private

    def assign_default_role
      self.add_role(:beginner) if self.roles.blank?
    end
end
