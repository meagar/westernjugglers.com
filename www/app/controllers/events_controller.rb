class EventsController < ApplicationController
  # GET /events
  def index
    @events = @calendar ? @calendar.future_events : []
  end

	def history
		@events = @calendar ? @calendar.all_events : []
    render 'index'
	end

end
