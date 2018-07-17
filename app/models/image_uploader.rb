require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    versions = { original: io }

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:small] = pipeline.resize_to_fill!(610,865)
    end

    versions
  end
end
