module RecordsHelper

	def holder_score (holder)
		if holder.record.unit == 'time'
			# score is an integer in microseconds
			h = (holder.score / (360000.0)).floor
			m = ((holder.score % 360000) / 6000.0).floor
			s = (holder.score % 600) / 100.0
			return "#{h} hours, #{m} minutes, #{s} seconds"
		end

		"#{holder.score} #{holder.record.unit.downcase}"
	end

end
