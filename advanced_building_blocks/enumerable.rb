module Enumerable
	
	def my_each
		
		i = 0
		
		while i < self.length
			
			yield(self[i])
			i += 1
		
		end

		self
	end

	def my_each_with_index

		i = 0

		while i < self.length

			yield(self[i],i)
			i+= 1

		end

		self
	end

	def my_all?

		all = true
		i = 0
		
		while i < self.length
			
			if !yield(self[i])

				all = false
			
			end

			i += 1
		end

		all
	end

	def my_any?

		any = false
		i = 0
		
		while i < self.length
			
			if yield(self[i])

				any = true
			
			end

			i += 1
		end

		any
	end

	def my_none?

		none = true
		i = 0
		
		while i < self.length
			
			if yield(self[i])

				none = false
			
			end

			i += 1
		end

		none
	end

	def my_count?(*item)

		raise ArgumentError.new("wrong number of arguments (given #{item.length}, expected 1)") if item.length > 1
		i = 0
		counter = 0

		if block_given?

			while i < self.length
				
				if yield(self[i])

					counter += 1

				end

				i += 1
			
			end

		elsif item.length == 0

			counter = self.length

		else

			while i < self.length
				
				if self[i] == item[0]

					counter += 1

				end

				i += 1

			end

		end

		counter
	end

	def my_map input = Proc.new

		output = []

		if block_given?

			output.replace(self)
			i = 0

			while i < self.length
				
				output[i] = yield(self[i])
				i += 1
			
			end

		else

			output.replace(self)
			i = 0

			while i < self.length
				
				output[i] = input.call(self[i])
				i += 1
			
			end

		end

	output
	end

	def my_inject(*args)

		if block_given?

			if args.length == 0

				i = 1
				memo = self.first 
		
				while i < self.length
			
					memo = yield(memo, self[i])
					i += 1
		
				end

			elsif args.length == 1

				i = 0
				memo = args[0]

				while i < self.length
			
					memo = yield(memo, self[i])
					i += 1
		
				end

			else

				raise ArgumentError.new("wrong number of arguments (given #{args.length}, expected 1)")
			
			end

		else

			if args.length == 0

				raise LocalJumpError.new("no block given")

			elsif args.length == 1

				i = 1
				memo = self.first 
		
				while i < self.length
			
					memo = memo.send args[0], self[i]
					i += 1
		
				end

			elsif args.length == 2

				i = 0
				memo = args[0] 
		
				while i < self.length
			
					memo = memo.send args[1], self[i]
					i += 1
		
				end

			else

				raise ArgumentError.new("wrong number of arguments (given #{args.length}, expected 1..2")

			end

		end

	memo
	end

end