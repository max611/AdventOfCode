require 'pp'

class Day10

	def initialize(s)
		answer = s

		for i in 1..40
			output = modify(answer)
			answer = output
		end

	end

	def modify(n)
		output = n.to_enum(:scan, /(\d)\1*/).map { Regexp.last_match }
		new_output = ""

		for j in 0..output.size-1
			nb = output[j][0].size.to_s
			number = output[j][0][0].to_s
			new_output = new_output + nb + number


		end


		puts new_output.size
		return new_output
	end

end

test = Day10.new("1113222113")