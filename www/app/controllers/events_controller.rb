class EventsController < ApplicationController
  # GET /events
  def index
    @events = @calendar.future_events
  end

	def history
		@events = @calendar.all_events
	end

end
