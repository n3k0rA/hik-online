class CommentsController < ApplicationController
  
  respond_to :html, :js
  
  after_filter :create_micropost, :only => [:create]
  after_filter :deletable_comment, :only=>[:destroy]
  before_filter :authenticate_user!, except: [:report_spam]
  
  
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @event = @comment.event
    @comment.save



    respond_with @comment, :location => @comment.event
    
    
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html {redirect_to @comment.event}
      format.json {head :ok}
    end
  end
  
  def report_spam
    @comment = Comment.find(params[:id])
    #AdminMailer..... notfy the admin with comment.id and user.id if !nil?
    flash[:notice] = "The comment has been notify to the admins. Thanks for your"
    redirect_to @comment.event
  end
  
  
  
  private 
  
  def deletable_comment
    @comment = Comment.find(params[:id])
    if Time.now > (@comment.created_at + 5.minutes)
      flash[:notice] = 'This comment is already in memory system and cannot be deleted'
      redirect_to @comment.event
      return false
    end
  end
  
  
end