path = ""

File.open('path.txt','r') do |f|
   f.each_char do |c| # iterate on each character
      path << c
   end
end

robo_x = robo_y = 0
santa_x = santa_y = 0
count = 0

houseDone = {}
houseDone[0] = Hash.new(0)
houseDone[0][0] = 1



path.each_char do |z|
	case z
	when "v"
		count.even? ? robo_y -= 1 : santa_y -= 1
    when "^"
		count.even? ? robo_y += 1 : santa_y += 1
	when ">"
		count.even? ? robo_x += 1 : santa_x += 1
    when "<"
		count.even? ? robo_x -= 1 : santa_x -= 1
	end

    houseDone[robo_x] = Hash.new(0) unless houseDone[robo_x].is_a?(Hash)
	houseDone[santa_x] = Hash.new(0) unless houseDone[santa_x].is_a?(Hash)
	count.even? ? houseDone[robo_x][robo_y] += 1 : houseDone[santa_x][santa_y] += 1
	count += 1
end 

total = 0

houseDone.keys.each do |x|
  houseDone[x].keys.each do |y|
    total += 1 if houseDone[x][y] > 0
  end
end


puts total