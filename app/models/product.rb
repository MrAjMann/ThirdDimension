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
  end
  
end
