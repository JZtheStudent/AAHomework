
require "set"

class GraphNode
    
    attr_accessor :value, :neighbors 
    
    def initialize(value)
        @value = value
        @neighbors= []
    end
    
    

end

def bfs(starting_node, target_value)
    reached = Set.new
    my_queue = [starting_node]
    
    until my_queue.empty?
        cur_node = my_queue.shift
        return cur_node if cur_node.value == target_value
        cur_node.neighbors.each do |neighbor|
            my_queue << neighbor unless reached.include?(neighbor)
            reached.add(neighbor)
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")