class SearchController < ApplicationController
  def index
    @stores = BestBuyStore.find_by_zipcode(params[:q])
  end
end
