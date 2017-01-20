# lib/paperclip_processors/custom.rb
module Paperclip
  class Custom < Processor
    def make

      contents = File.open(@file.path, "rb") {|f| f.read }
      encoded = Base64.strict_encode64(contents)
      base64head = "data:#{@file.content_type};base64,"
      dst = TempfileFactory.new.generate(@out_file)
      File.open(dst, 'wb') { |f|f.write(base64head + encoded)}
      convert(':src -type Grayscale :dst',
              src: File.expand_path(file.path),
              dst: File.expand_path(dst.path))
      dst
    end  
  
    def make1
      basename = File.basename(file.path, File.extname(file.path))
      dst_format = options[:format] ? ".\#{options[:format]}" : ''

      dst = Tempfile.new([basename, dst_format])
      dst.binmode

      convert(':src -type Grayscale :dst',
              src: File.expand_path(file.path),
              dst: File.expand_path(dst.path))

      dst
    end
  end
end

