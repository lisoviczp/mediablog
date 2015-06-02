class Vibe < ActiveRecord::Base

	def getSrc
		if self.vibeType == "2"
			source ="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"
			source += self.uid
			source += "&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
		else self.vibeType == "3"
			source ="https://www.youtube.com/embed/"
			source += self.uid if self.uid
		end	
	end

end
