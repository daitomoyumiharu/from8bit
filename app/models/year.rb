class Year < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1970年代', image_url: 'game1970.jpg' },
    { id: 3, name: '1980年代', image_url: 'game1980_2.jpg' },
    { id: 4, name: '1990年代', image_url: 'game1990.jpg' },
    { id: 5, name: '2000年代', image_url: 'game2000.jpg' },
    { id: 6, name: '2010年代', image_url: 'game2010.jpg' },
    { id: 7, name: '2020年代', image_url: 'game2020.jpg' },
    { id: 8, name: '不明(unknown)', image_url: 'unknown.jpg' }

  ]

  include ActiveHash::Associations
  has_many :musics
end
