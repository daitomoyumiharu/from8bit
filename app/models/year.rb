class Year < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1970年代' },
    { id: 3, name: '1980年代' },
    { id: 4, name: '1990年代' },
    { id: 5, name: '2000年代' },
    { id: 6, name: '2010年代' },
    { id: 7, name: '2020年代' },
    { id: 8, name: '不明(unknown)' },
 
  ]

  include ActiveHash::Associations
  has_many :musics

  end