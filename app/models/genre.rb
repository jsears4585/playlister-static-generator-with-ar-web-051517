class Genre < ActiveRecord::Base
  include Slugifiable::Slug
  
  has_many :songs
  has_many :artists, through: :songs
end
