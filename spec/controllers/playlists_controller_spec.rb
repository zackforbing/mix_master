require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "GET #index" do
    it "assigns all playlists as @playlists and renders the index template" do
      playlist = create(:playlist)

      get(:index)

      expect(assigns(:playlists)).to eq([playlist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested playlist as @playlist and renders the show template" do
      playlist = create(:playlist)

      get(:show, params: {:id => playlist.to_param})

      expect(assigns(:playlist)).to eq(playlist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new playlist as @playlist and renders the new template" do
      get :new
      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
  end

  describe "GET #edit" do
    it "assigns the playlist-to-edit as @playlist and renders the edit template" do
      playlist = create(:playlist)

      get(:edit, params: {:id => playlist.to_param})
      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, params: {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, params: {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, params: {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, params: {:playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested playlist" do
        playlist = create(:playlist)
        put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "whatever")}
        playlist.reload
        expect(playlist.name).to eq("whatever")
      end

      it "assigns the requested playlist as @playlist" do
        playlist = create(:playlist)
        put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "whatever")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist" do
        playlist = create(:playlist)
        put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "whatever")}
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist as @playlist" do
        playlist = create(:playlist)
        put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "re-renders the 'edit' template" do
        playlist = create(:playlist)
        put :update, params: {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
