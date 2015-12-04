path = ""

File.open('path.txt','r') do |f|
   f.each_char do |c| # iterate on each character
      path << c
   end
end

x = y = 0

houseDone = {}

houseDone[x] = Hash.new(0)
houseDone[x][y] = 1



path.each_char do |z|
	case z
	when "v"
		y +=1
    when "^"
		y -=1
	when ">"
		x += 1
    when "<"
		x -= 1
	end

    houseDone[x] = Hash.new(0) unless houseDone[x].is_a?(Hash)
    houseDone[x][y] += 1
end 

total = 0

houseDone.keys.each do |xx|
  houseDone[xx].keys.each do |yy|
    total += 1 if houseDone[xx][yy] > 0
  end
end


puts total