class Api::V1::ItemsController < ApplicationController
  # before_action :set_item, only: %i[show update destroy]

  def index
    items = Item.all
    render json: items, status: 200
  end

  def show
    item = Item.find(params[:id])
    if item
      render json: item, status: 200
    else
      render json: { error: 'Item not found' }
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 200
    else
      ender json: { error: 'Something might be wrong. Item could not be created.' }
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :unit, :icon)
  end
end
