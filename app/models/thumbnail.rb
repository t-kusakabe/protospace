class Thumbnail < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :thumbnail, ImageUploader

  enum status: { main: '0', sub: '1' }
  validates :thumbnail, presence: true
end
