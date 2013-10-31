class CommentsController < ApplicationController

  def create
    current_user.comments.create params[:comment]
    redirect_to track_path(params[:comment][:track_id])
  end

  def flag
    @track = Track.find params[:track_id]
    @comment = @track.comments.find params[:comment_id]
    @comment.is_flagged = true
    @comment.save
    redirect_to @track
  end

  def flagged 
    @comments = Comment.where(is_flagged: true).all
  end

  def destroy 
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to flagged_comments_path
  end
end