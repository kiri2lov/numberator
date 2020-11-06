class Numberator::NumbersProvider
	def initialize(io, limit = 1000, block_size = 4096)
		@io = io
		@buf = String.new(capacity: limit + 4)
		@block_size = block_size
		@limit = limit
	end

	def each_number(&block)
		buf1 = String.new(capacity: @block_size)
		buf2 = String.new(capacity: @limit)
		rex = Regexp.new(/\d+/)

		loop do
			begin
				@io.readpartial(@block_size, buf1)
				if is_digit?(buf1[-1].ord)
					buf2.clear
					@limit.times do
						b = @io.readbyte
						is_digit?(b) ? buf2 << b : break
					end
					buf1 += buf2 if !buf2.empty?
				end
			rescue EOFError
				break
			ensure
				buf1.scan(rex) { |n| yield(n.to_i) }
				buf1.clear
			end
		end
	end

	def is_digit?(c)
		c >= 48 and c <= 57
	end
end
