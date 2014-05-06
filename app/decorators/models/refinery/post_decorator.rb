Refinery::Blog::Post.class_eval do
	# Whitelist the :featured_image_id parameter for form submission
	attr_accessible :featured_image_id
	belongs_to :featured_image, :class_name => '::Refinery::Image'

	validates :featured_image, presence: true
end