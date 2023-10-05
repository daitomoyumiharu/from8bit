FactoryBot.define do
  factory :music do
    association :user
    genre_id { Faker::Number.between(from: 1, to: 10) }
    year_id { Faker::Number.between(from: 1, to: 6) }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    
    # image属性とmusic_file属性を設定
    transient do
      image_file_path { Rails.root.join('public/images/test_image.png') }
      music_file_path { Rails.root.join('public/audio/test_music.mp3') }
    end

    after(:build) do |music, evaluator|
      music.image.attach(io: File.open(evaluator.image_file_path), filename: 'test_image.png')
      music.music_file.attach(io: File.open(evaluator.music_file_path), filename: 'test_music.mp3')
    end
  end
end