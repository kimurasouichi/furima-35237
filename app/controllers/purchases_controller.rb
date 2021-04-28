class PurchasesController < ApplicationController
  def create
    @item = Item.new
  end
end
