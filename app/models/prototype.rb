class Prototype < ActiveRecord::Base
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails, reject_if: proc { |attributes| attributes[:thumbnail].blank? }

  validates :title, :catch_copy, :concept, :thumbnails, presence: true
end
