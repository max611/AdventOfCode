cities = []
cityList = Hash.new{ |h,k| h[k] = Hash.new }

File.open('day9.txt') do |f|
  f.lines.each do |line|
    line = line.chomp
	places, dist = line.split(" = ")
	dist = dist.to_i
	city1, city2 = places.split(" to ")
	cityList[city1][city2] = dist
	cityList[city2][city1] = dist
  end
end

shortest = 10000
shortest_p = nil
longest = 0
longest_p = nil

cityList.keys.permutation.each do |perm|
	dist = 0
  (0..perm.length - 2).each do |i|
    city1 = perm[i]
    city2 = perm[i+1]
    dist += cityList[city1][city2]
  end
  if dist < shortest
    shortest = dist
    shortest_perm = perm
  end
  if dist > longest
    longest = dist
    longest_p = perm
  end
end

puts "shortest: #{shortest}"
puts "longest: #{longest}"
