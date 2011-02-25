class ApplicationController < ActionController::Base
  protect_from_forgery

	def initialize
		super

		@calendar = GoogleCalendar.new
		@next_meeting = @calendar.future_meetings.first
		@next_event = @calendar.future_events.first
	end

end
