class PurchasesController < ApplicationController
  before_action :set_itme
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index]

  def index
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_itme
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_order).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: current_user.id,
                                                                                                                       token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']    # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def contributor_confirmation
    redirect_to root_path unless current_user != @item.user
  end
end
