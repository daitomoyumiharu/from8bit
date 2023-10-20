class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one_attached :music_file
  has_many :comments, dependent: :destroy
  belongs_to :genre
  belongs_to :year
  has_many :likes, dependent: :destroy

  validates :user, presence: { message: 'ユーザーを選択してください' }
  validates :image, presence: { message: '画像を選択してください' }
  validates :title, presence: { message: 'タイトルを入力してください' }
  validates :description, presence: { message: '説明を入力してください' }
  validates :music_file, presence: { message: '音楽ファイルを選択してください' }
  validates :year_id, presence: { message: '年代を選択してください' }
  validates :genre_id, presence: { message: 'ジャンルを選択してください' }

  # 選択が「--」の時(1の時)は保存不可のバリデーション
  validates :year_id, numericality: { other_than: 1, message: '年代を選択してください' }
  validates :genre_id, numericality: { other_than: 1, message: 'ジャンルを選択してください' }

  validate :music_file_content_type, if: -> { music_file.attached? }

  def description_with_links
    # description フィールド内のURLをリンクに変換するロジックを実装
    description.gsub(URI::DEFAULT_PARSER.make_regexp, '<a href="\0">\0</a>').html_safe
  end

  #いいね済みか否か判定
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ransackable_attributes(auth_object = nil)
    # 検索を許可する属性のリスト
    %w[title description year_id genre_id game_name]
  end

  # 検索可能な関連付けを定義する
  def self.ransackable_associations(auth_object = nil)
    # 検索可能な関連付けの名前を記述
    %w[comments genre year user] 
  end

  # カスタムのransackスコープを追加
  def self.ransackable_scopes(auth_object = nil)
    [:search__id_as_text]
  end

  # idをテキストとして検索するためのスコープ
  def self.search__id_as_text(query)
    where("cast(year_id as text) LIKE :query OR cast(genre_id as text) LIKE :query", query: "%#{query}%")
  end

  private

  def music_file_content_type
    acceptable_types = ['audio/mp3', 'audio/mpeg', 'audio/wav']
    return if acceptable_types.include?(music_file.content_type)

    errors.add(:music_file, 'はMP3またはWAVファイルである必要があります')
  end
end
