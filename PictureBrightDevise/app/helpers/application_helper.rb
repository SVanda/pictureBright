module ApplicationHelper
  
  def download_url_for(userfile_key)
    AWS::S3::S3Object.url_for(userfile_key, BUCKET_NAME, :authenicated => false)
  end
  
end
