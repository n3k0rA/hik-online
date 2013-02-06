class ConversationsController < ApplicationController 
  
  before_filter :authenticate_user!
  before_filter :conversation , :except => [:index]
  
  def index
    @conversation = Conversation.last
     @receipts = current_user.mailbox.receipts_for(@conversation).not_trash
    @conversation.participants.each do |p|
      if p.id != current_user.id
        @receiver = p
      end
    end
    
    
    @conversations = current_user.mailbox.conversations
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
    #text = params[:body].to_s
    #raise foo
    current_user.reply_to_conversation(@conversation, params[:message] [:body])
    redirect_to user_conversation_path(@conversation.id)
  end
    
  
  def update
    #last_receipt = current_user.mailbox.receipts_for(params[:conversation_id]).last
    #raise foo
    #raise params[:name]
    @conversation = Conversation.find(params[:id])
   # raise @conversation
    @user = User.find(7)
    @receipt =@user.reply_to_conversation(@conversation, params[:body])
    
    redirect_to user_conversation_path(@conversation.id)
    @receipt.mark_as_read
  end
  
  
  private
  
  def conversation
    @conversation = Conversation.find(params[:id])
  end
  
end
