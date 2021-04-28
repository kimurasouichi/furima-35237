class OrdersController < ApplicationController
  

  
  def create
    @item = Item.new
  end
end
