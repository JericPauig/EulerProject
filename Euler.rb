require 'prime'

def find_all_factors number
	a = []
	factor = 1
	while factor < Math.sqrt(number) do
		if number % factor == 0
			a << factor
			a << number / factor
		end
		factor += 1
	end
	return a
end

def get_prime_factorization number
	temp_prime_factors = Prime.prime_division(number)
	prime_factors = []
	i = 0
	while i < temp_prime_factors.length do
		j = 0
		while j < temp_prime_factors[i][1] do
			prime_factors << temp_prime_factors[i][0]
			j += 1
		end
		i += 1
	end
	return prime_factors
end

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
	a = find_all_factors 600851475143
	i = a.length
	while i > 0 do
		if a[i-1].prime?
			return a[i-1]
		end
		i -= 1
	end
end

def problem_4
	998001.downto(10000).each do |i|
		if i.to_s == i.to_s.reverse
			b = find_all_factors i
			x = 0
			while x < b.length do
				if (i / b[x]).to_s.length == 3 && b[x].to_s.length == 3
					return i
				end
				x += 1
			end
		end
	end
end

def problem_5
	all_factors = []
	20.downto(1).each do |number|
		factors = (get_prime_factorization number)
		factors.each do |factor|
			all_factors_count = all_factors.count(factor)
			factors_count = factors.count(factor)
			if all_factors_count < factors_count
				i = 0
				while i < factors_count - all_factors_count do
					all_factors << factor
					i += 1
				end
			end
		end
		all_factors.sort!
	end
	all_factors.flatten.sort!
	sum = 1
	i = 0
	while i < all_factors.length do
		sum *= all_factors[i]
		i += 1
	end
	return sum
end

def output_problems
	puts "Problem 1: #{problem_1}"
	puts "Problem 2: #{problem_2}"
	puts "Problem 3: #{problem_3}"
	puts "Problem 4: #{problem_4}"
	puts "Problem 5: #{problem_5}"
end


puts "Euler Project"
output_problems

