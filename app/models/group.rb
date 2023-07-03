class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
  has_one_attached :image
#   accepts_nested_attributes_for :group_users

  validates :name, presence: true
  validates :introduction, presence: true

  def is_owned_by?(user)
    owner_id == user.id
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
