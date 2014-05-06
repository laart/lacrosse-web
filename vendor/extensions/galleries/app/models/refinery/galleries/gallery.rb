module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'

      attr_accessible :title, :description, :position

      has_many :image_pages, :as => :item, :order => 'position ASC'
			has_many :images, :through => :image_pages, :order => 'position ASC'
			has_many_page_images

      validates :title, :presence => true, :uniqueness => true
      validates :image_pages, :presence => true
    end
  end
end
