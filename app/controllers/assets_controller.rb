class AssetsController < ApplicationController
  require 'open-uri'
  before_filter :authenticate_user!  #authenticate for users before any methods is called
  
      
  def index
    @assets = current_user.assets 
  end
  
  def show
    @asset = current_user.assets.find(params[:id])
  end
  
  def new
    @asset = current_user.assets.new
  end
  
  def create
    @asset = current_user.assets.new(asset_params)
    #@asset = current_user.assets.new(params[:asset])
    if @asset.save
      redirect_to assets_path, :notice => "Successfully created asset."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @asset = current_user.assets.find(params[:id])
  end
  
  def update
    @asset = current_user.assets.find(params[:id])
  end
  
  def destroy
    @asset = current_user.assets.find(params[:id])
    @asset.destroy
    redirect_to assets_url, :notice => "Successfully destroyed asset."
  end
  
  private
  
  def asset_params
      params.require(:asset).permit(:user_id, :uploaded_file)
  end
  
end
