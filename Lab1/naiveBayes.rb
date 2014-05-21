require 'NBayes'
nbayes = NBayes::Base.new
# Train
for i in 0..5
  Dir.foreach("./data/train/"+i.to_s+"/") do |item|
    next if item == '.' or item == '..'
    File.open("./data/train/"+i.to_s+"/"+item) do |file|
    	nbayes.train(file.gets.split(/\s+/), i)
    end
  end
end
# Test
puts 'Id,Category'
Dir.foreach('./data/test') do |item|
  next if item == '.' or item == '..'
  File.open("./data/test/"+item) do |file|
  	tokens = file.gets.split(/\s+/)
  	result = nbayes.classify(tokens)
  	print item.split('.')[0]
  	print ','
  	puts result.max_class
  end
end