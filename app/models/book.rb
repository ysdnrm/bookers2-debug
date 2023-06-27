class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # バリデーション
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  # いいね機能でのユーザーの存在
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
