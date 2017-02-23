require "rails_helper"

describe "Search page with paginate" do
  it "user sees pages of 10 results each" do
    visit "/"

    fill_in(:q, with: "80202")
    click_on("search")

    click_on("page 2")

    expect(page).to have_content("16 Total Stores")
    expect(page).to have_content("Page 2")
    expect(page).to have_selector(".store", count: 6)
  end
end
