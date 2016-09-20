class StoreSearchService

  def initialize(zip_code)
    @connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
  end

  def json_response_for_stores
    parsed_response(@connection.body)['stores']
  end

  def json_response_for_total
    parsed_response(@connection.body)['total']
  end

  def parsed_response(response)
    JSON.parse(response)
  end
end
