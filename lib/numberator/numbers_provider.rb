# frozen_string_literal: true

module Numberator
  class NumbersProvider
    def initialize(io, limit = 1000, block_size = 4096)
      @io = io
      @block_size = block_size
      @limit = limit
    end

    def each_number
      buf1 = String.new(capacity: @block_size)
      buf2 = String.new(capacity: @limit)
      rex = Regexp.new(/\d+/)

      loop do
        @io.readpartial(@block_size, buf1)
        if digit?(buf1[-1].ord)
          buf2.clear
          @limit.times do
            b = @io.readbyte
            digit?(b) ? buf2 << b : break
          end
          buf1 += buf2 unless buf2.empty?
        end
      rescue EOFError
        break
      ensure
        buf1.scan(rex) { |n| yield(n.to_i) }
        buf1.clear
      end
    end

    def digit?(chr)
      chr >= 48 and chr <= 57
    end
  end
end
