class Card < ApplicationRecord

  include ImageUploader[:photo]


  validates :email, format: { with: /.*@.*/, message: "has to have an @ sign" }, allow_nil: true

end
