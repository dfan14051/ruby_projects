def stock_picker prices

	min_day, max_day, profit = 0, 0, 0
	i = 1

	while i <= prices.length - 2

		(0...i).each do |day|

			if(prices[i] - prices[day] > profit)
				min_day, max_day, profit = day, i, prices[i] - prices[day] 
			end

		end
		i += 1
	
	end
	

	return "[#{min_day}, #{max_day}]"

end

puts stock_picker([17,3,6,9,15,8,6,1,10])