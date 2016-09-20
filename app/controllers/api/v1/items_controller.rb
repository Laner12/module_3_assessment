class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    response = Item.all
    respond_with response
  end

  def show
    response = Item.find(params[:id])
    respond_with response
  end

  def destroy
    response = Item.find(params[:id]).delete
    respond_with response
  end
end
