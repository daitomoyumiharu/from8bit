class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :genre
  belongs_to :year

  validates :user, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :music_file, presence: true
  validates :year_id, presence: true
  validates :genre_id, presence: true



   
  # 選択が「--」の時(1の時)は保存不可のバリデーション
  validates :year_id,numericality: { other_than: 1 , message: "年代を選択してください" }
  validates :genre_id,numericality: { other_than: 1 , message: "ジャンルを選択してください" }


end
