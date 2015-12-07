lights = []
#light_grid = [[],[]]
light_grid = Array.new(1000) { Array.new(1000) { 0 } }
status = ""
start = ""
fin = ""
n = 0
total = 0


File.open('day6.txt') do |f|
  f.lines.each do |line|
    lights << line
  end
end


lights.each { |x|
	status = x.match('turn on|turn off|toggle')
	start = x[/#{status}(.*?)through/m, 1]
	fin = x.partition('through')[2].strip
	fin_a = fin.gsub(/,.*/, '').strip
	fin_b = fin.partition(',')[2].strip
	start_a = start.gsub(/,.*/, '').strip
	start_b = start.partition(',')[2].strip

	case status.to_s
      when "turn on"
      	n = 1
      when "turn off"
    	n = - 1
      when "toggle"
        n = 2
	end

	for i in start_a.to_i..fin_a.to_i
		for j in start_b.to_i..fin_b.to_i
			light_grid[i][j] = light_grid[i][j] + n

			if light_grid[i][j] < 0
				light_grid[i][j] = 0
			end
		end
	end

}

puts light_grid.flatten.inject { |total, x| total + x }