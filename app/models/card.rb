class Card < ApplicationRecord
  include ImageUploader[:photo]
end
