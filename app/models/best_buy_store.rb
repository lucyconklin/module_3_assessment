class BestBuyStore
  attr_reader :long_name,
              :city,
              :distance,
              :phone_number,
              :type

  def initialize(attributes)
    @long_name    = attributes["longName"]
    @city         = attributes["city"]
    @distance     = attributes["distance"]
    @phone_number = attributes["phone"]
    @type         = attributes["storeType"]
  end

  def self.find_by_zipcode(zipcode)
    stores = BestBuyService.find_by_zipcode(zipcode)
    stores.map do |raw_store|
      new(raw_store)
    end
  end
end
