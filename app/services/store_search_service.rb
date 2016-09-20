class StoreSearchService

  def initialize(zip_code)
    @connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    parsed_response(@connection.body)
  end

  def parsed_response(response)
    JSON.parse(response)
  end
end
