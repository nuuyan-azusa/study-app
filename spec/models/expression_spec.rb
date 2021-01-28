require 'rails_helper'

RSpec.describe Expression, type: :model do
  describe '正規表現の保存' do
    before do
      @expression = FactoryBot.build(:expression)
    end

    context '正規表現が保存できる時' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@expression).to be_valid
      end
      it 'url_textは入力されていなくても保存できる' do
        @expression.url_text = nil
        expect(@expression).to be_valid
      end
    end

    context '正規表現が保存できない時' do
      it 'nameが空だと保存できない' do
        @expression.name = nil
        @expression.valid?
        expect(@expression.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと保存できない' do
        @expression.text = nil
        @expression.valid?
        expect(@expression.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @expression.user = nil
        @expression.valid?
        expect(@expression.errors.full_messages).to include('User must exist')
      end
    end
  end
end
