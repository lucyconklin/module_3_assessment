require 'rails_helper'

describe "Items API" do
  before do
    @item_1 = Item.create(name: "Widget",
                          description: "everyone needs one",
                          image_url: "/")

    @item_2 = Item.create(name: "Roomba",
                          description: "everyone needs two",
                          image_url: "/")
  end
  xit "can return all items" do
    get "/api/v1/items"

    items = JSON.parse(response.body)
    item = items.first
    expect(items.count).to eq(2)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).not_to have_key("created_at")
    expect(item).not_to have_key("updated_at")
  end

  xit "can return one item by id" do
    get "/api/v1/items/#{@item_1.id}"

    item = JSON.parse(response.body)

    expect(item["name"]).to eq
  end

  xit "can delete one item by id" do

  end

  xit "can create an item" do

  end
end
