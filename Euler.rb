require 'prime'
def problem_1
	sum = 1
	for i in 1..10000
		sum += i if i % 3 == 0 || i % 5 == 0
	end
	return sum
end

def problem_2
	x = 1
	y = 2
	sum = 0
	while x < 4000000 || y < 4000000 do
	 	if x % 2 == 0
	 		sum += x
	 	end
		z = y
		y = x + y
		x = z
	end
	return sum
end

def problem_3
	a = []
	factor = 1
	number = 600851475143
	while factor < Math.sqrt(number) do
		if number % factor == 0
			a << factor
			a << number / factor
		end
		factor += 1
	end
	i = a.length
	while i > 0 do
		if a[i-1].prime?
			return a[i-1]
		end
		i -= 1
	end
end

def problem_4


end

def output_problems
	puts "Problem 1: #{problem_1}"
	puts "Problem 2: #{problem_2}"
	puts "Problem 3: #{problem_3}"
end


puts "Euler Project"
output_problems

