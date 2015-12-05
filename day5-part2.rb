strings = []

File.open('strings.txt') do |f|
  f.lines.each do |line|
    strings << line
  end
end

total = 0

strings.each{ |x|
	if x.scan(/(..).*\1/).size > 0
		if x.scan(/(.).\1/).size > 0
			total += 1
		end
	end

}

puts total