puts "Swift Stats Activate!"
data = File.read "lyrics.txt"


sanitized_data = data.downcase.gsub(/[^a-z0-9\s]/i, '')

sanitized_array  = sanitized_data.split
puts "Total Word Count: #{sanitized_array.count}"
puts "Total Unique Words: #{sanitized_array.uniq.count}"

count = sanitized_array.inject({}) do |hsh, x|
  if hsh[x].nil?
    hsh[x] = 1
  else
    hsh[x] += 1
  end
  hsh
end
metrics = count.sort_by do |key, value|
  value
end

top_twenty = metrics.reverse.first(20)

#metrics.reverse.each do |metric|
#  puts "Word: #{metric[0]} Occurrences: #{metric[1]}"
#end

puts top_twenty
