frequency = Hash.new{|frequency,k| frequency[k] = [0, 0, 0, 0, 0, 0, 0]}
# Reading
for i in 0..5
  Dir.foreach('./data/train/'+i.to_s+"/") do |item|
    next if item == '.' or item == '..'
    File.open("./data/train/"+i.to_s+"/"+item) do |file|
      tokens = file.gets.split(/\s+/)
      tokens.each {|x| frequency[x][i] = frequency[x][i] +1}
    end
  end
end
# Calculate total occurance times
frequency.each {|key, value| frequency[key][6] = value[0] + value[1] + value[2] + value[3] + value[4] + value[5]}
# Calculate probability
for i in 0..5
  frequency.each {|key, value| frequency[key][i] = value[i] * 1.0 / (value[6] - value[i])}
end
# Find the most indicative words
sorted = Array.new
for i in 0..5
  puts i
  puts "================"
  sorted[i] = Hash[frequency.sort_by {|k,v| v[i]}.reverse]
  count = 0
  sorted[i].each_pair do |k,v|
    if v[6] > 20
      puts k
      count += 1
    end
    if count >= 50
      break
    end
  end
end