require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing

  process(:store) do |io, context|
    resize_to_fill!(io.download, 200, 275) { |cmd| cmd.auto_orient }
  end
end
