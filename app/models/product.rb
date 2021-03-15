class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validate :image_type

  private

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png))
        errors.add(:images, "needs to be a JPEG or PNG")
      end
    end
  end

end
