
lights = []
#light_grid = [[],[]]
light_grid = Array.new(1000) { Array.new(1000) { false } }
status = ""
start = ""
fin = ""
n = false
toggle = false


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
      	n = true
      	toggle = false
      when "turn off"
        n = false
        toggle = false
      when "toggle"
        toggle = true
	end

	for i in start_a.to_i..fin_a.to_i
		for j in start_b.to_i..fin_b.to_i
			if toggle
				light_grid[i][j] = !light_grid[i][j]
			else
				light_grid[i][j] = n
			end
		end
	end

}

puts light_grid.flatten.count(true)