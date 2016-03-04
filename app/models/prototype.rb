class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails, reject_if: proc { |attributes| attributes[:thumbnail].blank? }



  validates :title, :catch_copy, :concept, :thumbnails, presence: true
end
