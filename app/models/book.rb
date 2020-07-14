class Book < ApplicationRecord
  default_scope -> { kept }
  include Discard::Model
  has_one_attached :image
end
