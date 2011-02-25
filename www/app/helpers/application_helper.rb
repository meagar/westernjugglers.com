
module ApplicationHelper

	def markdown (str)
		bc = BlueCloth.new(str)
		bc.to_html.html_safe
	end

	def top_nav
		nav_links = [
			[ 'Home',      '/' ],
			[ 'Calendar',  '/calendar' ],
			[ 'Meetings',  '/meetings' ],
			[ 'Executives','/executives' ],
			[ 'Gallery',   '/gallery' ],
			[ 'Events',    '/events' ],
			[ 'Records',   '/records' ],
			[ 'Contact',   '/contact' ],
			[ 'Links',     '/links' ],
		]	

		html = ''

		logger.info(request.fullpath);
		active = false;
		nav_links.each do |i|
			link_class = i[0].downcase;
			if request.fullpath == i[1] && !active
				link_class += ' active'
				active = true
			end
			html += "<li class=\"#{link_class}\"><a href=\"#{i[1]}\">#{i[0]}</a></li>";
		end

		"<ul>#{html}</ul>".html_safe
	end


	def admin_div (&block)
		concat('<div class="admin-options">'.html_safe)

		yield

		concat('</div>'.html_safe)

		return
	end

end
