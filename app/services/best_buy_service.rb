class BestBuyService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zipcode},25)))?&format=json&show=city,distance,longName,phone,storeType&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    # @total = JSON.parse(response)["total"]
    stores = JSON.parse(response.body)["stores"]
  end
end
