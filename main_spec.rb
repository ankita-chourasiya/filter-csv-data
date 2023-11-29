require_relative 'main'

RSpec.describe 'Main Script' do
  describe 'print_csv' do
    context 'when the input file exists' do
      let(:existing_file) { 'clients.csv' }

      before do
        allow(File).to receive(:exist?).with(existing_file).and_return(true)
      end

      it 'prints the content of the CSV file' do
        expect { print_csv(existing_file) }.to output.to_stdout
      end
    end

    context 'when the input file does not exist' do
      let(:nonexistent_file) { 'nonexistent_file.csv' }

      before do
        allow(File).to receive(:exist?).with(nonexistent_file).and_return(false)
      end

      it 'prints a file not found message' do
        expect { print_csv(nonexistent_file) }.to output("File #{nonexistent_file} not found.\n").to_stdout
      end
    end
  end

  describe 'process_csv' do
    it 'prints a processing complete message' do
      input_file = 'clients.csv'
      output_file = 'output.csv'

      expect { process_csv(input_file, output_file) }.to output(include('Processing complete. Output CSV file created')).to_stdout
    end
  end

  describe 'puts_help' do
    it 'prints the help message' do
      expect { puts_help }.to output(/Usage:/).to_stdout
    end
  end
end
