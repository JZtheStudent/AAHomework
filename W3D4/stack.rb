
class Stack
    def initialize
        @array = []
    end

    def push(el)
        @array << el
    end

    def pop
        @array.pop
    end

    def peek
        @array.last
    end
  end