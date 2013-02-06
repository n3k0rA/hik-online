class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :store_location
  before_filter :set_locale
  
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
    if current_user
      current_user.locale = params[:locale]
      current_user.save
    end
    session[:locale] = I18n.locale
  end
  
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  #These 2 methods keep track to the user last page to redirect properly after sign in & log in
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
  
  private
  
    #Extraxt locale from header to guess the browser language of the suer
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
    
    def create_micropost
      if @content
        @micropost = Micropost.new(:user_id => current_user.id, :content => @content)
        if @comment #in case of comment
          @micropost.comment_id = @comment.id
          @micropost.event_id = @event.id
        elsif @event #in case of event created/updated or user follows an event
          @micropost.event_id = @event.id
          if @user #in case of translation commited
            @micropost.user_id = @user.id
          end
        elsif @follow
          @micropost.follow_id = @follow.id
        else #in case of...
          @micropost.target_id = @user.id
        end
        @micropost.save
      end
    end
    
    def delete_follow_micropost
      @mp = Micropost.where(:target_id => @user.id)
      @mp = @mp.where(:content => 2)
      @mp = @mp.where(:user_id => current_user.id)
      @mp.first.destroy
    end

    
end
