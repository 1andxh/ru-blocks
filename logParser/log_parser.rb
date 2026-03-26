class LogParser
    
  attr_reader :counts , :filepath

  def initialize(filepath)
        @filepath=filepath.upcase

        @counts = Hash.new(0) # init counter at 0
  end

  def parse 
      begin
        puts "Parsing log file: #{filepath} ..."

        File.foreach(@filepath) do |line| # stream file line by line
            parts = line.split("|")

            log_level = parts[0].strip

            @counts[log_level] += 1
        end
        puts "Parsing complete"

      rescue Errno::ENOENT
            puts "Error: FIle '#{filepath} was not found."
            return
      rescue => e
            puts "An unexpected error occurred: #{e.message}"
      end
  end

  def log_counts
        @counts.values.sum  
  end

  def print_logs
        puts "\n--- Log Summary ---"

        @counts.each do |level, count|
          puts "#{level}: #{count} occurences"
          
        end
        puts ""
        puts "Total logs: #{log_counts}" # read log sum
  end

end

parser = LogParser.new("dummu.log")
parser.parse 
parser.print_logs