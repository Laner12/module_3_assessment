class SearchController < ApplicationController

  def index
    @stores = Store.all_by_zip_code(params['zip_code_search'])

    zip_code = params["zip_code_search"]
    connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    @stores = JSON.parse(connection.body)['stores']
  end
end
