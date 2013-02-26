class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to @entry, :notice => "Successfully created entry."
    else
      render :action => 'new'
    end
  end

  def index
    if I18n.locale.to_s == "eu"
      @entries = Entry.where('eu = ?', true).all
    elsif I18n.locale.to_s == "en"
      @entries = Entry.where('en = ?', true).all
    elsif I18n.locale.to_s == "fr"
      @entries = Entry.where('fr = ?', true).all
    else
      @entries = Entry.where('es = ?', true).all
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
  end
  
  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to @entry, :notice  => "Successfully updated entry."
    else
      render :action => 'edit'
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_url, :notice => "Successfully destroyed entry."
  end
end
