class User < ActiveRecord::Base
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :dividers
  has_many :invoices, through: :dividers
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
