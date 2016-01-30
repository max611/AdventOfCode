#Sugar: capacity 3, durability 0, flavor 0, texture -3, calories 2
#Sprinkles: capacity -3, durability 3, flavor 0, texture 0, calories 9
#Candy: capacity -1, durability 0, flavor 4, texture 0, calories 1
#Chocolate: capacity 0, durability 0, flavor -2, texture 2, calories 8

ingredient_properties = [ [3,0,0,-3,2],
            [-3, 3, 0, 0, 9],
            [-1,0,4,0,1],
            [0,0,-2,2,8] ]

maximum = 0
maximum_for_500calories = 0

totalamount = 100
for i in 1..totalamount do
    remaining1 = totalamount - i
    for j in 1..remaining1 do
        remaining2 = remaining1 - j
        for k in 1..remaining2 do
            remaining3 = remaining2 - k
            for l in 1..remaining3 do
                amounts = [i,j,k,l]

                total = 1
                calories = 0
                for m in 0..3 do
                    total_per_property = 0
                    for n in 0..3 do
                        total_per_property = total_per_property + amounts[n]*ingredient_properties[n][m]
                    end
                    if total_per_property < 0 then
                        total_per_property = 0
                    end
                    total = total*total_per_property
                    calories = calories + amounts[m]*ingredient_properties[m][4]
                end

                if total > maximum
                    maximum = total
                end
                if total > maximum_for_500calories && calories == 500
                    maximum_for_500calories = total
                end
            end
        end
    end
end

puts "Part 1 solution: " + maximum.to_s
puts "Part 2 solution: " + maximum_for_500calories.to_s