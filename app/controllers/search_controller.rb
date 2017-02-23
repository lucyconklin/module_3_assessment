class SearchController < ApplicationController
  def index
    @stores = BestBuyStore.find_by_zipcode(params[:q])
    @total = BestButyStore.total
  end
end
