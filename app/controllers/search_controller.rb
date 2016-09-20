class SearchController < ApplicationController

  def index
    zip_code = params["zip"]
    connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    JSON.parse(connection.body)
  end
end
