class Record < ActiveRecord::Base
	has_many :record_holders, :order => 'time DESC'

	def current_holder
		record_holders.first
	end

	def past_holders
		record_holders.length > 1 ? record_holders.last(record_holders.length - 1) : [] 
	end

end
