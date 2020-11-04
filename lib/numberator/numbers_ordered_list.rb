require 'linked-list'

class Numberator::NumbersOrderedList
	def initialize(limit)
		@list = LinkedList::List.new
		@limit = limit
	end

	def << (v)
		@list.each_node do |node|
			if v > node.data
				@list.insert_before_node(v, node)
				@list.size > @limit and @list.pop
				v = nil
				break
			end
		end
		if (v && @list.size < @limit) || @list.size == 0
			@list.push(v)
		end
	end

	def each_number(&block)
		@list.each(&block)
	end
end
