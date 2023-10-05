require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
  end

  describe 'バリデーション' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@music).to be_valid
      end

      it 'ジャンルが「---」以外であれば登録できる' do
        @music.genre_id = 2
        expect(@music).to be_valid
      end

      it '年代が「---」以外であれば登録できる' do
        @music.year_id = 2
        expect(@music).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザーが存在しない場合、投稿できないこと' do
        @music.user = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('User ユーザーを選択してください')
      end

      it '画像が存在しない場合、投稿できないこと' do
        @music.image = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('Image 画像を選択してください')
      end

      it 'タイトルが存在しない場合、投稿できないこと' do
        @music.title = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('Title タイトルを入力してください')
      end

      it '説明が存在しない場合、投稿できないこと' do
        @music.description = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('Description 説明を入力してください')
      end

      it '音楽ファイルが存在しない場合、投稿できないこと' do
        @music.music_file = nil
        @music.valid?
        expect(@music.errors.full_messages).to include('Music file 音楽ファイルを選択してください')
      end

      it '年代が1の場合、投稿できないこと' do
        @music.year_id = 1
        @music.valid?
        expect(@music.errors.full_messages).to include('Year 年代を選択してください')
      end

      it 'ジャンルが1の場合、投稿できないこと' do
        @music.genre_id = 1
        @music.valid?
        expect(@music.errors.full_messages).to include('Genre ジャンルを選択してください')
      end

      it '音楽ファイルが許可されていない形式の場合、投稿できないこと' do
        @music.music_file.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.jpg')),
          filename: 'test_image.jpg',
          content_type: 'image/jpeg'
        )
        puts @music.music_file.inspect
        @music.valid?
        expect(@music.errors.full_messages).to include('Music file はMP3またはWAVファイルである必要があります')
      end
    end
  end
end