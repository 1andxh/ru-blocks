class LogParser
    
  attr_reader :counts , :filepath

  def initialize(filepath)
        @filepath=filepath.upcase

        @counts = Hash.new(0) # init counter at 0
  end

  def parse 
        puts "Parsing log file: #{filepath} ..."

        File.foreach(@filepath) do |line| # stream file line by line
            parts = line.split("|")

            log_level = parts[0].strip

            @counts[log_level] += 1
        end
        puts "Parsing complete"
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

parser = LogParser.new("dummy.log")
parser.parse 
parser.print_logs