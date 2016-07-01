class Thumbnail < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :thumbnail, ImageUploader

  enum status: [:main, :sub]
  # validates :thumbnail, presence: true
end
