class Executive < ActiveRecord::Base

	validates_length_of :name, :within => 1..100
	validates_length_of :about, :within => 1..500

	has_attached_file :photo, :styles => {
		:thumb => '128x', :med => '250x200'
	}

	def self.current
		where('active_year = (select MAX(active_year) from executives)')
	end

  def active?
    true
  end

end
