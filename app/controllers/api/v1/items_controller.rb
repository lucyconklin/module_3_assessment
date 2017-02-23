class Api::V1::ItemsController < ActionController::API
  before_action :set_item, only: [:destroy, :show]
  
  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def destroy
    @item.destroy
    render :nothing => true, :status => 204
  end

  def create
    item = Item.create(item_params)
    render json: item, :status => 201
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
