class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :main_thumbnail, ImageUploader
  mount_uploader :sub_thumbnail1, ImageUploader
  mount_uploader :sub_thumbnail2, ImageUploader
  mount_uploader :sub_thumbnail3, ImageUploader
end
