class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :listings
  has_many :reservations, through: :listings

  def self.most_res
    Neighborhood.all.sort_by{ |neigh| neigh.reservations.count}.last
  end

  def self.highest_ratio_res_to_listings
    self.all.sort_by {|neigh| neigh.res_to_listing}.last
  end

  def res_to_listing
    if self.listings.count != 0
      return self.reservations.count / self.listings.count
    else
      return 0
    end
  end
end

