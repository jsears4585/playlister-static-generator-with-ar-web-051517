class Song < ActiveRecord::Base
  include Slugifiable::Slug

  belongs_to :artist
  belongs_to :genre
end
