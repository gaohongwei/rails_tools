  has_mongoid_attached_file :image,
    :path           => '/:cs_user_md5/:style',
    :url            => '/:cs_user_md5/:style',
    :storage        => :s3,
    :s3_credentials => {
      bucket: 'staging_sensitive_attachments'
    },
    styles: { 'logo.:extension'.to_sym => "200x200>", thumb: "100x100>" , 'logo.txt'.to_sym => 'base64'},
    processors: [:custom]
  
  module Paperclip
  class Custom < Processor
    def initialize(file, options = {}, attachment = nil)
      super
      @style               = options[:style]
      @current_format      = File.extname(@file.path)
      @basename            = File.basename(@file.path, @current_format)
      @out_file = 'alogo.txt'
    end
    def make

        contents = File.open(@file.path, "rb") {|f| f.read }
        encoded = Base64.strict_encode64(contents)
        base64head = "data:#{@file.content_type};base64,"
        dst = Tempfile.new(@out_file)
        File.open(dst, 'wb') { |f|f.write(base64head + encoded)}
        dst

    end
  end
end
