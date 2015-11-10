class OrganizationUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  validates :user_id, uniqueness: { scope: :organization_id, message: "is already a member"
  }
end