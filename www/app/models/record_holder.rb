class RecordHolder < ActiveRecord::Base

	belongs_to :record

	def update_attributes(params)
		write_attribute('score', 0)
		super
	end

	def score_hours=(hours)
		logger.info('score_Hours=');
		write_attribute('score', read_attribute('score') + hours.to_f * (60 * 60 * 100))
	end

	def score_minutes=(minutes)
		logger.info('score_minutes');
		write_attribute('score', read_attribute('score') + minutes.to_f * (60 * 100))
	end

	def score_seconds=(seconds)
		logger.info('score_seconds');
		write_attribute('score', read_attribute('score') + seconds.to_f * 100)
	end

	def score_hours
		if @record.unit != 'time'
			throw "Unable to access score_secodns in non-time model"
		end
		read_attribute('score') / (360000)
	end

	def score_minutes
		if @record.unit != 'time'
			throw "Unable to access score_secodns in non-time model"
		end
		((read_attribute('score') % 360000) / 6000.0).to_i
	end

	def score_seconds
		if @record.unit != 'time'
			throw "Unable to access score_secodns in non-time model"
		end
		(read_attribute('score') % 600) / 100.0
	end

end
