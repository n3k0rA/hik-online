class CommentsController < ApplicationController
  
  
  
  after_filter :create_micropost, :only => [:create]
  before_filter :deletable_comment, :only=>[:destroy]
  before_filter :authenticate_user!, except: [:report_spam]
  

  
  def create
    @comment = Comment.create(params[:comment])
    @comment.user = current_user
    @comment.save
    @event = @comment.event
    
    respond_to do |format|
      if @comment.save
        @content = "1"
        format.html { redirect_to @comment.event }
        format.js
      else
        format.html { redirect_to  @comment.event, notice: "Comment body cannot be blank" }
        format.json { render json: @comment.event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  
  def destroy
    @comment = Comment.find(params[:id])
    @event = @comment.event
    @comment.destroy
    
    respond_to do |format|
      format.html {redirect_to @event}
      format.json {head :ok}
    end
  end
  
  def report_spam
    @comment = Comment.find(params[:id])
    #AdminMailer..... notfy the admin with comment.id and user.id if !nil?
    flash[:notice] = "The comment has been notify to the admins. Thanks for your help to improve!"
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