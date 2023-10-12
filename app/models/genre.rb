class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アクション(action)', image_url: 'action.jpg' },
    { id: 3, name: 'RPG', image_url: 'RPG.jpg' },
    { id: 4, name: 'シミュレーション(simulation)', image_url: 'simulation.jpg' },
    { id: 5, name: 'スポーツ(sports)', image_url: 'sports.jpg' },
    { id: 6, name: '戦略ゲーム(strategy)', image_url: 'strategy.jpg' },
    { id: 7, name: 'レーシング(racing)', image_url: 'racing.jpg' },
    { id: 8, name: 'ホラー(horror)', image_url: 'horror.jpg' },
    { id: 9, name: 'パズル(puzzle)', image_url: 'pazzle.jpg' },
    { id: 10, name: 'ファイティング(fighting)', image_url: 'fighting.jpg' },
    { id: 11, name: 'MMO(Massively Multiplayer Online)', image_url: 'MMO.jpg' },
    { id: 12, name: 'デジタルトレーディングカード(digital_trading_card)', image_url: 'card.jpg' },
    { id: 13, name: 'バトルロワイヤル(battle_royale)', image_url: 'battle.jpg' },
    { id: 14, name: '音ゲー(music_game)', image_url: 'music.jpg' },
    { id: 15, name: '不明(unknown)', image_url: 'unknown.jpg' },
    { id: 16, name: 'オリジナル楽曲(original_music)' }

  ]

  include ActiveHash::Associations
  has_many :musics
end
