#!/usr/bin/ruby
File.open("day23.txt") do |file|
  instructions = file.readlines
  iteration_count = instructions.size
  i=0
  registers = Hash.new
  #registers['a'] = 1 #Part 2
  registers['a'] = 1
  registers['b'] = 0
  VALUE_IS_ONE = 'jio'
  INCREMENT = 'inc'
  TRIPLE = 'tpl'
  HALF = 'hlf'
  VALUE_IS_EVEN = 'jie'
  JUMP = 'jmp'
  while i < iteration_count
    current_instruction = instructions[i]
    current_instruction.sub!(',', '')
    instruction_split = current_instruction.split ' '
    instruction = instruction_split[0]
    register = instruction_split[1]
    jump_value = instruction_split[2].to_i

    if instruction == VALUE_IS_ONE
      if registers[register] == 1
        i += jump_value
        next
      end
    end

    if instruction == INCREMENT
        registers[register] += 1
    end

    if instruction == TRIPLE
      registers[register] = registers[register] * 3
    end
    if instruction == HALF
      registers[register] = registers[register] / 2
    end
    if instruction == VALUE_IS_EVEN
      if (registers[register] % 2) == 0
        i += jump_value
        next
      end
    end

    if instruction == JUMP
      jump_value = register
      i += jump_value.to_i
      next
    end
    i += 1
  end
  puts "Value a is #{registers['a']}"
  puts "Value b is #{registers['b']}"
end