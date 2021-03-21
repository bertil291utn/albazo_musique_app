class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_artist

  # GET /tracks
  # GET /tracks.json
  def index
    # @artist_networks = @artist.mynetworks.includes(:network)
    @tracks = @artist.tracks
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = @artist.tracks.new
  end

  # GET /tracks/1/edit
  def edit
    @location = @artist.tracks.find(params[:id]).recorded_in
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to artist_tracks_url(params[:artist_id]), notice: "Track was successfully created." }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: "Track was successfully updated." }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: "Track was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
    @cities = Dpa.where(hierarchy: 2).ordered
    @tracksOrder = []
    10.times { |elem| @tracksOrder.push((elem + 1).to_s) }
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.permit(:name,
                  :album_name,
                  :recorded_in,
                  :track_url, :priority, :album_bg_url, :artist_id)
  end
end
