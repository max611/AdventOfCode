operations = []
values = []

File.open('day7.txt') do |f|
  f.lines.each do |line|
    operations << line
  end
end


puts operations