class Group < ApplicationRecord
  has_many :users, through: :group_users, source: :user
  has_many :group_users, dependent: :destroy
  # groupテーブルのカラム名がowner_idだった時は
  belongs_to :owner, class_name: 'User'
  has_one_attached :image
#   accepts_nested_attributes_for :group_users

  validates :name, presence: true
  validates :introduction, presence: true

  def is_owned_by?(user)
    owner_id == user.id
  end
  # 与えられたuserがグループのメンバーであるかどうかを判定する
  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
