class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # 入力されたデータをストロングパラメーターとして格納した上で変数@itemへ代入。
    @item = Item.new(items_params)
    # 保存の成功可否で条件分岐。成功：一覧ページへ／失敗：今のページ(商品情報入力画面)へ戻る
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipment_source_id,
                                 :shipment_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
