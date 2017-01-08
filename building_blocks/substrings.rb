def substrings (input, dictionary)

	input_words = input.split
	output = {}

	dictionary.each do |defined_word|

		input_words.each do |word|

			word = word.downcase

			defined_regex = defined_word

			while !word.match(defined_regex).nil?

				if output[defined_word].nil?
					output[defined_word] = 1
				else
					output[defined_word] += 1
				end

				defined_regex += '.*' + defined_word
			
			end
		end
	end

	return output

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)