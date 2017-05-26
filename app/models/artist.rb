class Artist < ActiveRecord::Base
  include Slugifiable::Slug

  has_many :songs
  has_many :genres, through: :songs
end
