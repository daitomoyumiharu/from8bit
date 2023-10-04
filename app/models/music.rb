class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one_attached :music_file

  belongs_to :genre
  belongs_to :year

  validates :user, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :music_file, presence: true
  validates :year_id, presence: true
  validates :genre_id, presence: true
  validate :music_file_content_type, if: -> { music_file.attached? }


   
  # 選択が「--」の時(1の時)は保存不可のバリデーション
  validates :year_id,numericality: { other_than: 1 , message: "年代を選択してください" }
  validates :genre_id,numericality: { other_than: 1 , message: "ジャンルを選択してください" }
  
  private
  def music_file_content_type
    acceptable_types = ['audio/mp3', 'audio/mpeg', 'audio/wav']
    unless acceptable_types.include?(music_file.content_type)
      errors.add(:music_file, 'はMP3またはWAVファイルである必要があります')
    end
  end

end
