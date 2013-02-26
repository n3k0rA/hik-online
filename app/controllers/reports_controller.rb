class ReportsController < ApplicationController
  
  def create
    @comment = Comment.find(params[:id])
    if current_user
      @report = Report.new(:user => current_user, :comment => @comment)
    else
      @report = Report.new(:comment => @comment)
    end
    if !@comment.reports.any?
      #AdminMailer..... notfy the admin with comment.id and user.id if !nil?
    end
    @report.save
    if @comment.reports.count > 10
      @comment.banned = true
      @comment.save
    end
    flash[:notice] = "The comment has been notify to the admins. Thanks for your help to improve!"
    redirect_to @comment.event
  end
  
  def destroy
  end
  
  def reset
    @comment = Comment.find(params[:id])
    @comment.reports.clear
    redirect_to @comment.event
  end
  
end