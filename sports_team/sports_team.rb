class SportsTeam

  attr_reader :name, :players, :points
  attr_accessor :coach

  def initialize(name, players, coach)
    @name = name
    @players = players
    @coach = coach
    @points = 0 # starts at 0
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def is_player(player)
    # could do something to catch up and downcase letters
    for name in @players
      if name == player
        return "YES! #{player} is in the team."
      else
        return "NO! They\'re not in the team."
      end
    end
  end

  def won?(answer)
    if answer
      @points += 1
    end
  end
  
end
