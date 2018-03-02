class Token < ApplicationRecord
  belongs_to :user
  after_create :assign_expire_date

  private
    def assign_expire_date
      self.update_attribute(:expires_at, 10.days.from_now)
    end
end
