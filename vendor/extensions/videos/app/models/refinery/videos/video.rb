module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel
      self.table_name = 'refinery_videos'

      attr_accessible :title, :url, :featured_image_id,:position

      belongs_to :featured_image, :class_name => '::Refinery::Image'
      validates :title, :url, :featured_image_id, :presence => true
    end
  end
end
