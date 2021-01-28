require 'rails_helper'

RSpec.describe Manner, type: :model do
  describe 'メソッドの保存' do
    before do
      @manner = FactoryBot.build(:manner)
    end

    context 'メソッドが保存できる時' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@manner).to be_valid
      end
      it 'url_textは入力されていなくても保存できる' do
        @manner.url_text = nil
        expect(@manner).to be_valid
      end
    end

    context '正規表現が保存できない時' do
      it 'nameが空だと保存できない' do
        @manner.name = nil
        @manner.valid?
        expect(@manner.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと保存できない' do
        @manner.text = nil
        @manner.valid?
        expect(@manner.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @manner.user = nil
        @manner.valid?
        expect(@manner.errors.full_messages).to include('User must exist')
      end
    end
  end
end
