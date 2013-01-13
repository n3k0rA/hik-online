if Rails.env == "production" 
   S3_CREDENTIALS = { :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :bucket => ENV['S3_BUCKET_NAME']} 
 else 
   S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end