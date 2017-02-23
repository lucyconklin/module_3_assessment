class SearchController < ApplicationController
  def index
    all_stores = BestBuyStore.find_by_zipcode(params[:q])
    @total = all_stores.count
    @stores = all_stores[0..9]
  end
end
