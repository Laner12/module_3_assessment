class SearchController < ApplicationController

  def index
    @stores = Store.all_by_zip_code(params['zip_code_search'])
  end
end
