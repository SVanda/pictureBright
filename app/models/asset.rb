class Asset < ActiveRecord::Base
  #attr_accessible :user_id, :uploaded_file
  
  
  belongs_to :user
  
  #set up "uploaded_file" field as attached_file (using Paperclip)
  has_attached_file :uploaded_file#,
              #:storage => :s3,
              #:s3_credentials => "#{Rails_ROOT}/config/s3.yml",
              #:s3_host_name => 's3-us-west-1.amazonaws.com',
              #:bucket => "picturebrightimages",
              ##:url => "/assets/:id/:basename.:extension",
              #:url => "https://picturebrightimages.s3.amazonaws.com/",
              #:path => "assets/:id/:basename.:extension"
  
  validates_attachment_size :uploaded_file, :less_than => 10.megabytes  
  validates_attachment_presence :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def file_name
    uploaded_file_file_name
  end
  def file_size
    uploaded_file_file_size
  end 
end
