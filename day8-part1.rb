strings = []

File.open('day8.txt') do |f|
  f.lines.each do |line|
    strings << line
  end
end

total_characters = 0
total_memory = 0
total_literal = 0

strings.each { |x|

	total_memory += eval(x).length
    total_characters += x.strip.length
    total_literal += x.strip.inspect.length

}

puts "total characters = #{total_characters}"
puts "total memory = #{total_memory}"
puts "total literaj = #{total_literal}"
puts "answer part 1 is #{total_characters - total_memory}"
puts "answer part 2 is #{total_literal - total_characters}"