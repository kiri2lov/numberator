class Numberator::NumbersOrderedList
	def initialize(limit)
		@limit = limit
		@list = []
	end

	def << (v)
		if @list.size == 0
			@list.push(v) and return
		end

		return if (@list.size == @limit && v <= @list.first) ||
			(v == @list.first || v == @list.last)

		if v < @list.first || v > @list.last
			if v < @list.first
				@list.unshift(v)
			else
				@list.push(v)
			end
		else
			@list.each_with_index do |x, i|
				if x > v
					@list.insert(i, v)
					break
				end
			end
		end
		@list.shift if @list.size > @limit
	end

	def each_number(&block)
		@list.sort_by{|x| -x}.each(&block)
	end
end
