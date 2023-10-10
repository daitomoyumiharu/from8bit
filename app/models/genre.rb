class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アクション(action)' },
    { id: 3, name: 'RPG' },
    { id: 4, name: 'シミュレーション(simulation)' },
    { id: 5, name: 'スポーツ(sports)' },
    { id: 6, name: '戦略ゲーム(strategy)' },
    { id: 7, name: 'レーシング(racing)' },
    { id: 8, name: 'ホラー(horror)' },
    { id: 9, name: 'パズル(puzzle)' },
    { id: 10, name: 'ファイティング(fighting)' },
    { id: 11, name: 'MMO(Massively Multiplayer Online)' },
    { id: 12, name: 'デジタルトレーディングカード(digital_trading_card)' },
    { id: 13, name: 'バトルロワイヤル(battle_royale)' },
    { id: 14, name: '音ゲー(music_game)' },
    { id: 15, name: '不明(unknown)' },
    { id: 16, name: 'オリジナル楽曲(original_music)' }

  ]

  include ActiveHash::Associations
  has_many :musics
end
