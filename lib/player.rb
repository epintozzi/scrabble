require "./lib/scrabble"

class Player

  def initialize
    @total = 0
    @words = []
  end

  def play(word)
    scrabble = Scrabble.new
    @words << word
    @total += scrabble.score(word)
  end

  def total
    @total
  end

  def won?
    if @total > 25
      return true
    else
      false
    end
  end

  def words
    @words
  end

  def tile_count
    tile_count = 0
    @words.each do |word|
      tile_count += word.length
    end
    return tile_count
  end

end
