require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see updated data for the playlist" do
    playlist              = create(:playlist_with_songs)
    first, second, third  = playlist.songs
    new_song              = create(:song, title: "New Song")
    updated_name          = "Different Name"

    visit playlist_path(playlist)
    click_on "Edit Playlist"
    fill_in "playlist_name", with: updated_name
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content playlist.name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end
