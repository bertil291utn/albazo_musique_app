class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :set_artist_details, only: [:new, :edit]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Genre.display_artists(session[:generos]).flatten
    # from a given genres array (DB, session) find all genres and dsiplay all artists from those genres
    # Add flatten at the end to break two dimnensions array
    #  = Artist.includes :tracks
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    # @tracks = @artist.tracks
    @artist_networks = @artist.artist_networks.includes(:network)
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    @genre = @artist.genre_list
    @city = @artist.dpa
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save!
        format.html { redirect_to @artist, notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: "Artist was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: "Artist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def set_artist_details
    @genres = Genre.all.ordered
    @location = Dpa.where(hierarchy: 2).ordered
  end

  # Only allow a list of trusted parameters through.

  def artist_params
    params.require(:artist).permit(:name, :dpa_id, :photourl, :spotify_artist_id, genre_list: [])
  end
end
