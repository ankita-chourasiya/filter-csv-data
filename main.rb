# main.rb

require_relative 'csv_processor'

def print_csv(input_file_path)
  unless File.exist?(input_file_path)
    puts "File #{input_file_path} not found."
    return
  end

  CSV.foreach(input_file_path, headers: true) do |row|
    puts row
  end
end

def process_csv(input_file_path, output_file_path)
  CSVProcessor.process(input_file_path, output_file_path)
end

def puts_help
  puts 'Usage:'
  puts '  print <input_file>                               Print the content of the CSV file.'
  puts '  process <input_file> <output_file>              Process the CSV file and create an output CSV file.'
  puts '  help                                             Display this help message.'
end

command = ARGV[0]

case command
when 'print'
  input_file_path = ARGV[1]
  print_csv(input_file_path)
when 'process'
  input_file_path = ARGV[1]
  output_file_path = ARGV[2]
  process_csv(input_file_path, output_file_path)
when 'help'
  puts_help
else
  puts 'Invalid command. Use: print <input_file> | process <input_file> <output_file> | help'
end
