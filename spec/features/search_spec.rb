require 'rails_helper'

describe "Best Buy store search" do
  before do
    @store = BestBuyStore.new(
      long_name: "CHERRY CREEK SHOPPING CENTER",
      city: "DENVER",
      distance: "3.45",
      phone_number: "303-270-9189",
      type: "Big Box"
    )
  end
  it "user can enter zipcode to see nearby stores" do
    VCR.use_cassette 'search' do
      visit "/"

      fill_in(:q, with: "80202")
      click_on("search")

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_selector(".store", count: 10)
      within first('.store') do
        save_and_open_page
        expect(page).to have_content(@store.long_name)
        expect(page).to have_content(@store.city)
        expect(page).to have_content(@store.distance)
        expect(page).to have_content(@store.phone_number)
        expect(page).to have_content(@store.type)
      end
    end
  end
end
