class BoxfileController < ApplicationController
  
    before_filter :authenticate_user!
  
  def index
    
    s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_ACCESS_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
    bucket = s3.buckets[BUCKET_NAME]
    
    
    if current_user.folder.nil?
      current_user.folder = generate_random_user_folder_name
      current_user.save
    end
    
    #@userfiles = AWS::S3::Bucket.objects(BUCKET_NAME, :prefix => current_user.folder)
    @userfiles = bucket.objects.with_prefix(current_user.folder)
  end
  
  def add 
  end
  
  def upload
    begin
      #AWS::S3::S3Object.store(sanitize_filename(params[:boxfile].original_filename), params[:boxfile].read, BUCKET_NAME, :access => :public_read)
      s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_ACCESS_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
      bucket = s3.buckets[BUCKET_NAME]
      sanitize_filename(params[:boxfile].original_filename)
      
      
      redirect_to boxfile_path, :notice => "Your picture was successfully uploaded"
      
    rescue
      redirect_to boxfile_path, :error => "Your file couldn't be uploaded"
    end
  end
  
  def delete
    if (params[:file_id])
      AWS::S3::S3Object.find(params[:file_id], BUCKET_NAME).delete
      redirect_to boxfile_path, :notice => params[:file_id].sub(current_user.folder + '/', '') + " was deleted"
    else
      redirect_to boxfile_path, :error => "Could not delete " + params[:file_id].sub(current_user.folder + '/', '')
    end
  end
  
  def sanitize_filename(file_name)
    just_filename = File.basename(file_name)
    File.join(current_user, folder, just_filename.sub(/[^\w\.\-]/,'_'))
  end
  
  def generate_random_user_folder_name()
    letters = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    return (0...8).map{ letters[rand(letters.length)]}.join
  end
  
  
end
