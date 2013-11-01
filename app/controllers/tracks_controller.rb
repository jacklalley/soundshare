class TracksController < ApplicationController

  load_and_authorize_resource

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = current_user.tracks.new params[:track]
    if @track.save
      redirect_to @track, notice: 'Song successfully uploaded'
    else
      flash.now[:alert] = 'Song failed to upload'
      render :new
    end
  end

  def show
    @comment = Comment.new
    @track = Track.find params[:id]
  end

  def destroy
    @track = Track.find params[:id]
    @track.destroy
    redirect_to tracks_url
  end
end