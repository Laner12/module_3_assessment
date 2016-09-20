require 'rails_helper'

RSpec.describe "items api" do
  it "returns all items" do
    item = create(:item, name: "lane")
    item2 = create(:item, name: "dan")

    get "/api/v1/items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(2)
  end

  it "should return one" do
    item = create(:item, name: "lane", id: 1)
    item2 = create(:item, name: "dan", id: 2)

    get "/api/v1/items/1"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq(6)
    expect(json['name']).to eq("lane")
    expect(json['id']).to eq(1)
    expect(json['name']).not_to eq("dan")
    expect(json['id']).not_to eq(2)
  end

  it "it should delete one" do
    item = create(:item, name: "lane", id: 1)
    item2 = create(:item, name: "dan", id: 2)

    delete "/api/v1/items/1"

    expect(response.body).to eq(204)
  end
end
