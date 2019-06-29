class Card < ApplicationRecord

  include ImageUploader[:photo]

  # validates_presence_of :photo_data, on: :update
  validates :email, format: { with: /.*@.*/, message: "has to have an @ sign" }, allow_nil: true
end
