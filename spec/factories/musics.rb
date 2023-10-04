FactoryBot.define do
  factory :music do
    association :user
    association :genre
    association :year
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    after(:build) do |music|
      music.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      music.music_file.attach(io: File.open('public/audio/test_music.mp3'), filename: 'test_music.mp3')
    end
  end
end