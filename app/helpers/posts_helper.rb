module PostsHelper

	def cp(path)
	  "header_links_current" if current_page?(path)
	end

end
