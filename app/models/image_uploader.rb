require "image_processing/mini_magick"

class ImageUploader < Shrine


    plugin :activerecord
    plugin :determine_mime_type
    plugin :validation_helpers
    plugin :processing
    plugin :versions
    plugin :delete_raw


    Attacher.validate do
      validate_min_size 1, message: "must not be empty"
      validate_max_size 5*1024*1024, message: "is too large (max is 5 MB)"
      validate_mime_type_inclusion  %w[image/jpeg image/png image/tiff]
      validate_extension_inclusion  %w[jpg jpeg png tiff tif]
    end

    process(:store) do |io, context|
      versions = { original: io }

      io.download do |original|
        pipeline = ImageProcessing::MiniMagick.source(original)

        versions[:small] = pipeline.resize_to_fill!(610,865)
      end

      versions
    end
end
