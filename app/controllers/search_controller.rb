require 'will_paginate/array'

class SearchController < ApplicationController
  def index
    all_stores = BestBuyStore.find_by_zipcode(params[:q])
    @total = all_stores.count
    @stores = all_stores.paginate(:page => params[:page], :per_page => 10)
  end
end
