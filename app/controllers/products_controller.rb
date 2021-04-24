class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:title, :text, :category_id, :condition_id, :burden_id, :area_id, :day_id)
  end
end
