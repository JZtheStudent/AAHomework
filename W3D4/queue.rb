

class Queue

    def initialize
        @array = []
    end

    def dequeue
        @array.shift
    end

    def enqueue(el)
        @array << el
    end

    def peek
        @array.first
    end

end