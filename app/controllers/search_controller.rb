class SearchController < ApplicationController

  def index
    zip_code = params["zip_code_search"]
    connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    output = JSON.parse(connection.body)['stores']
    @stores = output.map do |store|
      store['city']
      store['distance']
      store['longName']
      store['phone']
      store['storeType']
    end
  end
end
