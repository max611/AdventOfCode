input = File.read('path.txt').split('')

# initialize the positions of both santas
santas = [[0,0],[0,0]].cycle

# initialize the list of houses
houses = {[0,0] => 1}

# iterate over the delivery instructions
input.each do |instruction|
    # switch santas
    position = santas.next

    # move the santa
    case instruction
            when '>'; position[0] += 1
            when '<'; position[0] -= 1
            when '^'; position[1] -= 1
            when 'v'; position[1] += 1
    end

    # drop the gift
    houses[[position[0],position[1]]] = 1
end

# count the houses
houses.length