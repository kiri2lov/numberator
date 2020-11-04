class Numberator::NumbersProvider
	def initialize(io, limit)
		@io = io
		@buf = String.new(capacity: limit)
		@limit = limit
	end

	def each_number(&block)
		@io.each_char do |c|
			if is_digit = is_digit?(c)
				@buf << c
			end
			if (!is_digit && !@buf.empty?) || @buf.size == @limit
				block.(@buf.to_i)
				@buf.clear
			end
		end
		!@buf.empty? and block.(@buf.to_i)
	end

	def is_digit?(c)
		c >= '0' and c <= '9'
	end
end
