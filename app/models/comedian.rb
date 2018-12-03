class Comedian < ActiveRecord::Base
  validates_presence_of :name, :age, :city

  has_many :specials

  def self.avg_age
    average(:age).to_i
  end

  def self.unique_cities
  select(:city).distinct.map(&:city)
  end

end
