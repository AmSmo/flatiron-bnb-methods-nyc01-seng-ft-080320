class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review
  validates :checkin, presence: true
  validates :checkout, presence: true
  
  def duration
    self.checkout - self.checkin
  end

  def total_price
    duration * self.listing.price
  end
end
