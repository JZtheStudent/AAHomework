class Board
    attr_accessor :cups

    def initialize(name1, name2)
        @cups = Array.new(14) {Array.new }
        @name1 = name1
        @name2 = name2 
        place_stones
    end
    
    def place_stones
    # helper method to #initialize every non-store cup with four stones each
        
        (0...cups.length).each do |i|
            next if i == 6 || i == 13
            4.times do 
                cups[i] << :stone
            end
        end
    end
    

    def valid_move?(start_pos)
        raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
        raise "Starting cup is empty" if cups[start_pos].empty?
    end
    
    def make_move(start_pos, current_player_name)
        stones = cups[start_pos]
        cups[start_pos] = []
        
        cup_idx = start_pos
        until stones.empty?
            cup_idx += 1
            cup_idx = 0 if cup_idx > 13
            if cup_idx == 6
                cups[6] << stones.pop if current_player_name == @name1 
            elsif cup_idx == 13
                cups[13] << stones.pop if current_player_name == @name2 
            else
                @cups[cup_idx] << stones.pop 
            end
        end
        render 
        next_turn(cup_idx)
    end
    
    def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
        if ending_cup_idx == 6 || ending_cup_idx == 13
            :prompt 
        elsif @cups[ending_cup_idx].count == 1
            :switch
        else
            ending_cup_idx 
        end
    end

    def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
    end

    def one_side_empty?
        cups.take(6).all? { |cup| cup.empty?} || cups[7..12].all? { |cup| cup.empty? }
    end

    def winner
        player1_score = cups[6].length
        player2_score = cups[13].length 

        if player1_score > player2_score
            @name1 
        elsif player2_score > player1_score
            @name2
        else
            :draw
        end
    end
end
