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
  it "can return all items" do
    get "/api/v1/items"

    items = JSON.parse(response.body)
    item = items.first
    # binding.pry

    expect(response.status).to eq(200)
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

    expect(response.status).to eq(200)
    expect(item["name"]).to eq("Widget")
    expect(item["description"]).to eq("everyone needs one")
    expect(item["image_url"]).to eq("/")
    expect(item).not_to have_key("created_at")
    expect(item).not_to have_key("updated_at")
  end

  xit "can delete one item by id" do
    delete "/api/v1/items/#{@item_1.id}"

    expect(response.status).to eq(204)
    expect(Item.count).to eq(1)
  end

  xit "can create an item" do
    item_attributes = { name: "Trinkit",
                        description: "very shiny",
                        image_url: "/"}

    post "/api/v1/items", item: item_attributes

    item = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(item["name"]).to eq("Trinkit")
    expect(item["description"]).to eq("very shiny")
    expect(item["image_url"]).to eq("/")
    expect(item).not_to have_key("created_at")
    expect(item).not_to have_key("updated_at")
  end
end
