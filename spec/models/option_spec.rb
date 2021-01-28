require 'rails_helper'

RSpec.describe Option, type: :model do
  before do
    @option = FactoryBot.build(:option)
  end

  context 'オプションが保存できる時' do
    it '全ての情報が正しく入力されていれば保存できる' do
      expect(@option).to be_valid
    end
    it 'url_textは入力されていなくても保存できる' do
      @option.url_text = nil
      expect(@option).to be_valid
    end
  end

  context 'オプションが保存できない時' do
    it 'nameが空だと保存できない' do
      @option.name = nil
      @option.valid?
      expect(@option.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空だと保存できない' do
      @option.text = nil
      @option.valid?
      expect(@option.errors.full_messages).to include("Text can't be blank")
    end
    it 'userが紐づいていなければ保存できない' do
      @option.user = nil
      @option.valid?
      expect(@option.errors.full_messages).to include('User must exist')
    end
  end
end
