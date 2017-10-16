class Card < ApplicationRecord
  validates :email, presence: true
  validates :email, format: { with: /.*@.*/, message: "has to have an @ sign" }

  include ImageUploader[:photo]
end
