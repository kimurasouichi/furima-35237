class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_order = Purchase.new
  end
  
  def create
    @purchase_order = Purchase.new(purchase_params)
    if @purchase_order.valid?
      @purchase_order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private



  def purchase_params
    params.require(:purchase_order).permit(:user_id, :item_id).marge(user_id: current_user.id, item_id: current_user.id)
  end

  # def Order_params
  #   params.permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(purchase_id: @purchase.id)
  # end

end