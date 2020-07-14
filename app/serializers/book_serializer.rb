class BookSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,
  :uid,
  :artist_name,
  :title,
  :is_readed,
  :image

  def image
    url_for(object.image) if object.image.attachment
  end
end
