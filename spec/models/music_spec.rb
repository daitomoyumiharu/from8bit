require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
  end

  describe 'バリデーション' do
    context '全ての入力事項が正しく存在する場合' do
      it '投稿できること' do
        expect(@music).to be_valid
      end
    end

    context 'ユーザーが存在しない場合' do
      it '投稿できないこと' do
        @music.user = nil
        expect(@music).not_to be_valid
      end
    end

    context '画像が存在しない場合' do
      it '投稿できないこと' do
        @music.image = nil
        expect(@music).not_to be_valid
      end
    end

    context 'タイトルが存在しない場合' do
      it '投稿できないこと' do
        @music.title = nil
        expect(@music).not_to be_valid
      end
    end

    context '説明が存在しない場合' do
      it '投稿できないこと' do
        @music.description = nil
        expect(@music).not_to be_valid
      end
    end

    context '音楽ファイルが存在しない場合' do
      it '投稿できないこと' do
        @music.music_file = nil
        expect(@music).not_to be_valid
      end
    end

    context '年代が1の場合' do
      it '投稿できないこと' do
        @music.year_id = 1
        expect(@music).not_to be_valid
      end
    end

    context 'ジャンルが1の場合' do
      it '投稿できないこと' do
        @music.genre_id = 1
        expect(@music).not_to be_valid
      end
    end

    context '音楽ファイルが許可されていない形式の場合' do
      it '投稿できないこと' do
        @music.music_file.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test.img')), filename: 'test.img', content_type: 'text/plain')
        expect(@music).not_to be_valid
      end
    end
  end
end