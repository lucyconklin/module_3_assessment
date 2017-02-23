class SearchController < ApplicationController
  def index
    @stores = BestBuyStore.find_by_zipcode(params[:q])
    # @total = BestBuyStore.total
  end
end
