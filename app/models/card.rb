class Card < ApplicationRecord

  validates :email, format: { with: /.*@.*/, message: "has to have an @ sign" }, allow_nil: true

  include ImageUploader[:photo]

end
