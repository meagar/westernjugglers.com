class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :fetch_calendar, :store_location

	def fetch_calendar
    #@calendar = Rails.cache.read('calendar');
    #if (!@calendar)
      @calendar = GoogleCalendar.new
    #  Rails.cache.write('calendar', @calendar);
    #end

		@next_meeting = @calendar.future_meetings.first
		@next_event = @calendar.future_events.first
	end

	helper_method :current_user


	helper :all
  helper_method :current_user_session, :current_user

 	protected
    def current_user_session
      #return @current_user_session if defined?(@current_user_session)
      @current_user_session ||= UserSession.find
    end

    def current_user
      #return @current_user if defined?(@current_user)
      @current_user ||= current_user_session && current_user_session.record
    end

    def require_user
      unless current_user
        store_location
        redirect_to '/login', :notice => "You must be logged in to access this page"
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        redirect_to '/', :notice => "You must be logged out to access this page"
        return false
      end
    end

    def store_location
			if request.method == 'GET' and !request.fullpath.match /^\/(reset-password|login|logout|user-session)/
				logger.info("setting last uri to #{request.fullpath}")
				session[:return_to] = request.fullpath
			end
    end

		def last_uri
			session[:return_to] || '/'
		end

    def redirect_back_or_default (default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end
