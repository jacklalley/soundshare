class CommentsController < ApplicationController

  def create
    current_user.comments.create params[:comment]
    redirect_to track_path(params[:comment][:track_id])
  end
end