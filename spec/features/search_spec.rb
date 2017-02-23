require 'rails_helper'

describe "Best Buy store search" do
  # before do
  #   @store = BestBuyStore.create(
  #     long_name: "Long Name of Store",
  #     city: "City",
  #     distance: "100",
  #     phone_number: "5555555555",
  #     type: "type"
  #   )
  # end
  it "user can enter zipcode to see nearby stores" do
    visit "/"

    fill_in('search', with: "80202")
    click_on("search")

    expect(current_path).to eq(search_path)
    expect(page).to have_content("16 Total Stores")
    expect(page).to have_selector("store", count: 10)
    within('.store', match: first) do
      # expect(page).to have_content(@store.long_name)
      # expect(page).to have_content(@store.city)
      # expect(page).to have_content(@store.distance)
      # expect(page).to have_content(@store.phone_number)
      # expect(page).to have_content(@store.type)
    end
  end
end
