happiness_map = {}
people = []

File.foreach("day13.txt"){|line|
    # Tokenize
    line = line.strip! || line
    line = line.slice(0,line.length-1)
    tokens = line.lines(" ").to_a
    for t in tokens do
        t = t.strip! || t
    end

    # Extract values
    person = tokens[0]
    happinesschange = tokens[3].to_i
    if tokens[2] == "lose" then
        happinesschange = -happinesschange
    end
    person_to_left_or_right = tokens[10]

    # Add to people array and happiness map
    if(!people.include?(person)) then
        people.push(person)
    end
    happiness_map[person + person_to_left_or_right] = happinesschange
}

# Add this for part 2 of the puzzle
for p in people do
    happiness_map["Myself" + p] = 0
    happiness_map[p + "Myself"] = 0
end
people.push("Myself")

#Brute force search across all permutations of "people" array

permutations = people.permutation.to_a

maximum = -99999999
best_arrangement = nil 

for p in permutations do
    happiness = 0
    for i in 0..p.length-1 do
        happiness = happiness + happiness_map[p[i] + p[(i+1)%p.length]]
        happiness = happiness + happiness_map[p[(i+1)%p.length] + p[i]]
    end
    if happiness > maximum then
        maximum = happiness
        best_arrangement = p
    end
end

puts maximum.to_s
puts best_arrangement.to_s