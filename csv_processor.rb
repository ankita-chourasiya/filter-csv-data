# csv_processor.rb

require 'csv'
require_relative 'data_validator'

class CSVProcessor
  def self.process(input_file_path, output_file_path)
    CSV.open(output_file_path, 'w', write_headers: true, headers: ['Email', 'First Name', 'Last Name', 'Residential Address Street', 'Residential Area Locality', 'Residential Address State', 'Residential Address Postcode', 'Postal Address Street', 'Postal Address Locality', 'Postal Address State', 'Postal Address Postcode']) do |output_csv|
      count = 0
      total = 0
      CSV.foreach(input_file_path, headers: true) do |row|        
        total += 1
        
        if DataValidator.valid_email?(row['Email']) && DataValidator.valid_postcode?(row['Residential Address Postcode']) && DataValidator.valid_postcode?(row['Postal Address Postcode']) && DataValidator.valid_first_name?(row['First Name']) && DataValidator.valid_last_name?(row['Last Name']) 
        # && 
        # DataValidator.valid_geo_location(row['Residential Address Street'], row['Residential Address Locality'], row['Residential Address State'], row['Residential Address Postcode'])
          output_csv << row
        else
          puts "Invalid row: #{row}"
          count += 1
        end
      end
      puts "#{count} - fails"
      puts "#{total} - total"
    end

    puts 'Processing complete. Output CSV file created.'
  end
end
