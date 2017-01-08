CAPS_STARTING_POSITION = "A".ord
CAPS_ENDING_POSITION = "Z".ord
LOWER_STARTING_POSITION = "a".ord
LOWER_ENDING_POSITION = "z".ord

def caesar_cipher (input, shift_factor)

	output = ""

	input.split("").each do |character|

			if character.ord.between?(CAPS_STARTING_POSITION, CAPS_ENDING_POSITION)

				character = ((((character.ord - CAPS_STARTING_POSITION) + shift_factor) % 26) + CAPS_STARTING_POSITION).chr

			elsif character.ord.between?(LOWER_STARTING_POSITION, LOWER_ENDING_POSITION)

				character = ((((character.ord - LOWER_STARTING_POSITION) + shift_factor) % 26) + LOWER_STARTING_POSITION).chr

			end

			output << character

	end

	return output

end

puts caesar_cipher("What a string!", 5)