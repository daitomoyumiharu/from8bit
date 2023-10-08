class Comment < ApplicationRecord
  belongs_to :user  # User モデルとの関連
  belongs_to :music # Music モデルとの関連

  validates :text, presence: true
end
