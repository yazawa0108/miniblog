class Post < ApplicationRecord
  belongs_to :user
  has_many :comments 
  has_many :likes, dependent: :destroy  #主キーテーブル（post）が消えるときは、外部キーテーブル(like)も消えるように設定
  has_many :liked_users, through: :likes, source: :user
end
