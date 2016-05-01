module FoldersHelper
# require 'RMagick'

  def image_file_type? file
    return false if file.try(:path).nil?
    ["image/jpg", "image/jpeg", "image/gif", "image/png"].include? MIME::Types.type_for(file.path).first.content_type
  end
end
