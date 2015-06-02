class Post < ActiveRecord::Base

	def getSrc
		if self.uid
			source="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"
			source += self.uid
			source += "&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
		end	
	end

end
