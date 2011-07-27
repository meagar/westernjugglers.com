
class GoogleCalendar

	class Item 
		def initialize(event)
			@starts_at, @ends_at = event.dtstart.to_time - 5.hours, event.dtend.to_time - 5.hours
			@duration = (@ends_at - @starts_at) / 3600

			@location = event.location != "" ? event.location : nil

			@type = @duration > 2 ? :event : :meeting

			@name = event.summary

			@description = @homepage = nil

			if @type == :meeting
				if @name.match /^ucc( atrium)?/i
					@location = "the UCC"
				elsif @name.match /^alumni hall/i
					@location = "Alumni Hall"
				end
			end

			if event.description 
				parts = event.description.to_a
				@homepage = parts.shift if parts.length > 1 and parts[0].match /^http:\/\//
				@description = parts.join
			end

		end

		attr_reader :name, :description, :location, :starts_at, :ends_at, :duration, :homepage, :type 
	end

	def initialize
		url = 'http://www.google.com/calendar/ical/4l2em5a68d2m7uijpjnc1qbtbo%40group.calendar.google.com/public/basic.ics'

		require 'net/http'
		require 'uri'
		data = Net::HTTP.get URI.parse(url)

		cals = Icalendar.parse(data);
		
		@meetings = []
		@events = []

		cals.each do |cal|
			cal.events.each do |e|
				event = Item.new(e)
				@events << event if event.type == :event
				@meetings << event if event.type == :meeting
			end
		end

		[@events,@meetings].each do |m|
			m.sort! do |a,b|
				return 0 if a.starts_at == b.starts_at
				a.starts_at < b.starts_at ? 1 : -1
			end
		end
	end

	def events
		@events
	end

	def future_events
		@events.reject do |event|
			event.ends_at < Time.now
		end.reverse
	end

  def all_events
    @events
  end

	def meetings
		@meetings
	end

	def future_meetings
		@meetings.reject do |meeting|
			meeting.ends_at < Time.now
		end.reverse
	end

end
