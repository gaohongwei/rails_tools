Initializer: aws.rb
AWS.config(
  access_key_id: '',
  secret_access_key: '',
  region: 'region'
)

Initializer: paperclip.rb
Paperclip.interpolates('cs_user_md5') do |attachment, _style|
  "#{Digest::MD5.hexdigest(attachment.instance.cs_user)}"
end

development.rb
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: 'bucket_name'
    },
    path: '/:cs_user_md5/:class/:id.:extension',
    url: '/:cs_user_md5/:class/:id/:filename'
  }

Model
  has_mongoid_attached_file :aws_attachment,
    :path           => '/:cs_user_md5/attachment/:id/:style.:extension',
    :storage        => :s3, # :filesystem
    #:s3_host_alias  => 'something.cloudfront.net',
    #:s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
    s3_credentials: {
      bucket: 'bucket_name'
    }
##### local storage #####
  has_mongoid_attached_file :local_image,
    :storage        => :filesystem,
    :path           => ':rails_root/public/:style.:extension',
    :url            => ':style.:extension'
##### database storage #####
