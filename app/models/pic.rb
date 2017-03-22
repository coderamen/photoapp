class Pic < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  mount_uploader :photo ,PhotoUploader
end
