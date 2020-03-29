class Book < ApplicationRecord
  default_scope -> { kept }
  include Discard::Model
end
