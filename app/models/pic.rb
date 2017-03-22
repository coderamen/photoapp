class Pic < ApplicationRecord
  include PgSearch
  pg_search_scope :search_title, :against => [:title]
  acts_as_votable
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  mount_uploader :photo ,PhotoUploader

  pg_search_scope :search_full_text,
  
   :against => {
    :title => 'A',
    :description => 'B'
  },
  :using => {
    :tsearch => { :any_word => true }
  }
end
