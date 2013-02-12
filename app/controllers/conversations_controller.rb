class ConversationsController < ApplicationController 
  
  before_filter :authenticate_user!
  before_filter :conversation , :except => [:index]
  
  def index
    @conversation = current_user.mailbox.inbox.last
    @conversations = current_user.mailbox.conversations
    @receipts = current_user.mailbox.receipts_for(@conversation).not_trash
    @conversation.participants.each do |p|
      if p.id != current_user.id
        @receiver = p
      end
    end
    
    
    
  end
  
  def show
    #@conversation = Conversation.find(params[:id])
    @receipts = current_user.mailbox.receipts_for(@conversation).not_trash
    @conversation.participants.each do |p|
      if p.id != current_user.id
        @receiver = p
      end
    end
    
  end
  
  def reply
    current_user.reply_to_conversation(@conversation, params[:message] [:body])
    redirect_to user_conversation_path(@conversation.id)
  end
    
  
  def update
    @conversation = Conversation.find(params[:id])
    @user = User.find(7)
    @receipt =@user.reply_to_conversation(@conversation, params[:body])
    
    redirect_to user_conversation_path(@conversation.id)
    @receipt.mark_as_read
  end
  
  def destroy
    @conversation.move_to_trash(current_user)
  end

      
  
  private
  
  def conversation
    @conversation = Conversation.find(params[:id])
  end
  
end
