gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_can_make_word
    player = Player.new

    assert_equal 8, player.play('hello')
  end

  def test_it_can_calculate_total
    player = Player.new
    player.play("Hello")
    assert_equal 8, player.total
    player.play("Hi")
    assert_equal 13, player.total
    player.play("snacker")
    assert_equal 26, player.total
  end

  def test_if_player_has_won?
    player = Player.new

    refute player.won?
  end

  def test_if_play_won_with_25_points
    player = Player.new

    player.play("Hello")
    assert_equal 8, player.total
    player.play("Hi")
    assert_equal 13, player.total
    player.play("snacker")
    assert_equal 26, player.total

    assert player.won?
  end

  def test_it_returns_array_of_words_played
    player = Player.new

    player.play('hello')
    player.play('hi')
    player.play('snacker')

    assert_equal ['hello', 'hi', 'snacker'], player.words
  end

  def test_it_counts_tiles
    player = Player.new

    player.play('hello')
    player.play('hi')
    player.play('snacker')

    assert_equal 14, player.tile_count
  end

end
