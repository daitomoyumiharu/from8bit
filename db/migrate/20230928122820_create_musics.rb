class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.references :user,         null: false, foreign_key: true
      t.string     :game_name,    null: false
      t.string     :title,        null: false
      t.text       :description,  null: false
      t.integer    :year_id,      null: false
      t.integer    :genre_id,     null: false
      t.text       :target,       null: false

      t.timestamps
    end
  end
end
