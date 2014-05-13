Refinery::PagesController.class_eval do

	before_filter :find_galleries, :find_events, :find_blog_posts, :find_video, :only => [:home]
    
    def find_galleries
    	@galleries = Refinery::Galleries::Gallery.limit(3).order('created_at desc')
    end

    def find_events
    	@events = Refinery::Events::Event.limit(3).order('start_time desc')
    end

    def find_blog_posts
		@blog_posts = Refinery::Blog::Post.live.limit(2).order('created_at desc')    	
    end

    def find_video
        @video = Refinery::Videos::Video.order('created_at desc').last
    end
end