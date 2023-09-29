class Year < ActiveHash::Base
  self.data = [
    { id: 1, name: 'アクション(action)' },
    { id: 2, name: 'RPG' },
    { id: 3, name: 'シミュレーション(simulation)' },
    { id: 4, name: 'スポーツ(sports)' },
    { id: 5, name: '戦略ゲーム(strategy)' },
    { id: 6, name: 'レーシング(racing)' },
    { id: 7, name: 'ホラー(horror)' },
    { id: 8, name: 'パズル(puzzle)' },
    { id: 9, name: 'ファイティング(fighting)' },
    { id: 10, name: 'MMO(Massively Multiplayer Online)' },
    { id: 11, name: 'デジタルトレーディングカード(digital_trading_card)' },
    { id: 12, name: 'バトルロワイヤル(battle_royale)' },
    { id: 13, name: '音ゲー(music_game)' },
    { id: 14, name: '不明(unknown)' },
 
  ]

  include ActiveHash::Associations
  has_many :musics
  
  end