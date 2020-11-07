# frozen_string_literal: true

module Numberator
  class NumbersOrderedList
    def initialize(limit)
      @limit = limit
      @list = []
    end

    def <<(val)
      @list.push(val) and return if @list.size.zero?

      return if (@list.size == @limit && val <= @list.first) ||
                (val == @list.first || val == @list.last)

      if val < @list.first || val > @list.last
        if val < @list.first
          @list.unshift(val)
        else
          @list.push(val)
        end
      else
        @list.each_with_index do |x, i|
          if x > val
            @list.insert(i, val)
            break
          end
        end
      end
      @list.shift if @list.size > @limit
    end

    def each_number(&block)
      @list.sort_by(&:-@).each(&block)
    end
  end
end
