class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validate :image_type


  before_save :sync_data

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

  def sync_data
    self.name = self.name.strip
    self.description = self.description.strip
    self.name = self.name.downcase
    self.description = self.description.downcase
  end

end
