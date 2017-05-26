module Slugifiable
  module Slug
    def to_slug
      self.name.parameterize('-')
    end
  end
end
