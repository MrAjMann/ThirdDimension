class User < ApplicationRecord
  after_create :assign_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :products
  has_one_attached :avatar

         def assign_default_role
           self.add_role(:buyer) if self.roles.blank?
         end
         
         
end
