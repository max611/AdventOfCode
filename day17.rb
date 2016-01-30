#!/usr/bin/ruby
File.open('day17.txt') do |file|
  string = file.readlines
  containers = []
  string.each do |container|
    containers << container.to_i
  end
  egg_nog = 150
  combinations= []
  (1..containers.size).each do |i|
    combinations << containers.combination(i).select{|array|array.inject(:+) == egg_nog}
  end
  combinations.each{|comb|
    unless comb.size ==0
      puts "Part 2: size=#{comb[0].size} count=#{comb.size}"
      break;
    end
  }
  combinations_flatten = combinations.flatten(1)
  puts "Part 1: #{combinations_flatten.size}"
end