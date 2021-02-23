class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    # 入力されたデータをストロングパラメーターとして格納した上で変数@itemへ代入。その後、保存可否で条件分岐。
    @item = Item.new(items_params)
    # binding.pry
    # 保存の成功可否で条件分岐。成功：一覧ページへ／失敗：今のページ(商品情報入力画面)へ戻る
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  # テスト入力 "item"=>{"item_name"=>"aaa", "explanation"=>"ccc", "category_id"=>"1", "status_id"=>"1", "delivery_fee_id"=>"1", "shipment_source_id"=>"1", "shipment_day_id"=>"1", "price"=>""}, "commit"=>"出品する", "controller"=>"items", "action"=>"create"}
  # ここで格納するデータを限定する。
  def items_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipment_source_id ,:shipment_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
