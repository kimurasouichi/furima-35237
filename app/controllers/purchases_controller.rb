class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_order = Purchase.new
  end

  def create
    @purchase_order = Purchase.new(purchase_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render shared / error_messages
    end
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:user_id, :item_id).marge(user_id: current_user.id, item_id: current_user.id,
                                                                     token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']    # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
