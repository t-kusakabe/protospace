class ProtoThumbnail < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :main_thumbnail, ImageUploader
  mount_uploader :sub_thumbnail1, ImageUploader
  mount_uploader :sub_thumbnail2, ImageUploader 
end
