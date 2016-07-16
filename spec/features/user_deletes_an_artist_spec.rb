require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they see updated data for the artist" do
    artist        = Artist.create(name: "Jaga Jazzist", image_path: "http://bergenfest.no/sitefiles/site1/files/artimg/jaga-jazzist3.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content artist.name
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")
  end
end
