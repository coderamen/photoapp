class Pic < ApplicationRecord
  include PgSearch
  pg_search_scope :search_title, :against => [:title]
  acts_as_votable
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  mount_uploader :photo ,PhotoUploader
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, city, state, zipcode].compact.join(',')
  end

  pg_search_scope :search_full_text,

   :against => {
    :title => 'A',
    :description => 'B'
  },
  :using => {
    :tsearch => { :any_word => true }
  }
end
