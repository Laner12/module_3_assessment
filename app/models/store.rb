class Store
  attr_reader :city,
              :distance,
              :long_name,
              :phone,
              :store_type,
              :total

  def initialize(raw_store)
    @city = raw_store['stores']['city']
    @distance = raw_store['stores']['distance']
    @long_name = raw_store['stores']['longName']
    @phone = raw_store['stores']['phone']
    @store_type = raw_store['stores']['storeType']
    @total = raw_store['stores']['total']
  end

  def self.all_by_zip_code(zip_code)
    connection = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=city,distance,longName,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_API_KEY']}")
    binding.pry
    @stores = JSON.parse(connection.body).map do |store|
      Store.new(store)
    end
  end
end
