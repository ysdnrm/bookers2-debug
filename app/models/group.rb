class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  has_one_attached :image
#   accepts_nested_attributes_for :group_users
end
