class Store
  attr_reader :city,
              :distance,
              :long_name,
              :phone,
              :store_type,
              :total

  def initialize(raw_store)
    @city = raw_store['city']
    @distance = raw_store['distance']
    @long_name = raw_store['longName']
    @phone = raw_store['phone']
    @store_type = raw_store['storeType']
  end

  def self.all_by_zip_code(zip_code)
    response = StoreSearchService.new(zip_code)
    response.json_response_for_stores.map do |store|
      Store.new(store)
    end
  end
end
