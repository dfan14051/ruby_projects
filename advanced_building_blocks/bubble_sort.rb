def bubble_sort input

	still_sorting = true
	while still_sorting
		still_sorting = false
		i, j = 0, 1
		while j < input.length
			if(input[i] > input[j])
				input[i], input[j] = input[j], input[i]
				still_sorting = true
			end
			i += 1
			j += 1
		end
	end
	input

end

def bubble_sort_by input

	still_sorting = true
	while still_sorting
		still_sorting = false
		i, j = 0, 1
		while j < input.length
			if(yield(input[i],input[j]) > 0)
				input[i], input[j] = input[j], input[i]
				still_sorting = true
			end
			i += 1
			j += 1
		end
	end
	input
	
end