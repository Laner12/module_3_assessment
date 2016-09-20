class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    response = Item.all
    binding.pry
    respond_with response
  end
end
