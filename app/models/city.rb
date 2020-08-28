class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(start_date, end_date)
    self.listings.select do |listing| 
      listing.reservations.select do |reservation|
        Date.parse(start_date) > reservation.checkout || Date.parse(end_date) < reservation.checkin
      end
    end
  end
end

