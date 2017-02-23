class BestBuyService
  def self.find_by_zipcode(zipcode)
    response = Faraday.get("")
    stores = JSON.parse(response.body)
  end
end
