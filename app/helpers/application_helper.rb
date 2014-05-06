module ApplicationHelper

	#bootstrap dropdown fix
	def navigation_menu
	  presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
	  presenter.css = "navigation"
	  presenter.menu_tag = :nav
	  presenter.list_tag_css = "sf-menu"
	  presenter.first_css = ""
	  presenter.last_css = ""
	  presenter
	end

	def home?
		current_page?(refinery.root_path)
	end

	#Load controller specific js
	def javascript(*files)
  	content_for(:head) { javascript_include_tag(*files) }
	end

	#URL halper for player social links
	def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

end
