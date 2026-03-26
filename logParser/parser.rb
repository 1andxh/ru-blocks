logs = [
  "ERROR | 2026-03-26 | Database down",
  "INFO  | 2026-03-26 | User login",
  "ERROR | 2026-03-26 | Timeout",
  "INFO  | 2026-03-26 | Page view"
]

counts = Hash.new(0)

logs.each do |line|
    parts = line.split("|")

    level = parts[0].strip

    counts[level] += 1
end

puts "--- Log summary ---"
puts "Errors found: #{counts["ERROR"]}"
puts "Infos found: #{counts["INFO"]}"
