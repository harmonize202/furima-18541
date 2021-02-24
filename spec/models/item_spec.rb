require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/comment.png')
    end

    context '情報が保存できない時' do
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態についての情報が必須であること' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipment_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment day must be other than 1')
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end

    context '情報が保存できる時' do
      it '商品画像を1枚つけることが必須であること／販売価格は¥300~¥9,999,999の間のみ保存可能であること／販売価格は半角数字のみ保存可能であること' do
        expect(@item).to be_valid
      end
    end
  end
end
