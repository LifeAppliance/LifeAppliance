class Post < ApplicationRecord
  # TODO Add the missing.png file to assets
  validates :post_image, presence: true
  has_attached_file :post_image, styles: { large: "1920x1080>", medium: "612x612>", thumb: "161x161>" } #default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/

  scope :NewestFirst, lambda { order("posts.created_at DESC") }
end
