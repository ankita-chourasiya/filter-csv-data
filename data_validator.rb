# data_validator.rb

require 'geocoder'
require 'byebug'

class DataValidator
  def self.valid_email?(email)    
    email&.include?('@')
  end

  def self.valid_postcode?(postcode)
    !(postcode.nil? || postcode.empty?)
  end

  def self.valid_first_name?(first_name)
    !(first_name.nil? || first_name.empty?)
  end

  def self.valid_last_name?(last_name)
    !(last_name.nil? || last_name.empty?)
  end

  def self.valid_geo_location(city, state, country)
    address = [city, state, country].compact.join(', ')    
    !Geocoder.search(address).empty?
  end
end
