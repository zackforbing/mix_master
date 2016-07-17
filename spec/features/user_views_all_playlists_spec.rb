require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the names of each playlist" do
    playlists = %w(Metal Jazz Funk Workout).map do |playlist_name|
      Playlist.create(name: playlist_name)
    end

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
