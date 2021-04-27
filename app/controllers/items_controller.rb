class ItemsController < ApplicationController
  before_action :set_itme, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_itme
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :burden_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
