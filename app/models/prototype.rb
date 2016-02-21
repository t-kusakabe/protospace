class Prototype < ActiveRecord::Base
  has_many :proto_thumbnails
  accepts_nested_attributes_for :proto_thumbnails
end
