

class Map

    def initialize
        @arr_2d = Array.new { Array.new }
    end

    def set(key, val)
        @arr_2d.each do |item|
            if item[0] == key
                item[1] = val 
                return
            end
        end
        @arr_2d << [key, val]
    end

    def get(key)
        @arr_2d.each do |item|
            return item[1] if item[0] == key 
        end
    end

    def delete(key)
        @arr_2d.each_index do |i|
            if @arr_2d[i] == key 
                @arr_2d.delete_at(i)
                return 
            end
        end
    end

    def show
        puts "not sure what this function's supposed to do"
    end




end