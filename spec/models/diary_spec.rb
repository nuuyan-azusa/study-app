require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe '日記の保存' do
    before do
      @diary = FactoryBot.build(:diary)
    end

    context '日記が保存できる時' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@diary).to be_valid
      end
      it 'url_textは空でも保存できる' do
        @diary.url_text = nil
        expect(@diary).to be_valid
      end
      it 'hour_idは0でも保存できる' do
        @diary.hour_id = 0
        expect(@diary).to be_valid
      end
      it 'minute_idは0でも保存できる' do
        @diary.minute_id = 0
        expect(@diary).to be_valid
      end
    end

    context '日記が保存できない時' do
      it 'titleが空だと保存できない' do
        @diary.title = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空だと保存できない' do
        @diary.text = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Text can't be blank")
      end
      it 'year_idが0だと保存できない' do
        @diary.year_id = 0
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Year Select")
      end
      it 'month_idが0だと保存できない' do
        @diary.month_id = 0
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Month Select")
      end
      it 'day_idが0だと保存できない' do
        @diary.day_id = 0
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Day Select")
      end
      it 'rateが空だと保存できない' do
        @diary.rate = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Rate can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include('User must exist')
      end
    end
  end
end
