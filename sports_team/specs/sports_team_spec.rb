require('minitest/autorun')
require('minitest/rg')

require_relative('../sports_team')

class TestSportsTeam < MiniTest::Test

  def setup
    @sports_team = SportsTeam.new('Any Old Team', ['Tom', 'Dick', 'Harry'], 'Jeff Goldblum')
  end

  def test_team_name
    assert_equal('Any Old Team', @sports_team.name)
  end

  def test_team_players
    assert_equal(['Tom', 'Dick', 'Harry'], @sports_team.players)
  end

  def test_team_coach
    assert_equal('Jeff Goldblum', @sports_team.coach)
  end

  def test_set_coach
    @sports_team.coach = ('Marti Pellow')
    assert_equal('Marti Pellow', @sports_team.coach)
  end

  def test_add_player
    @sports_team.add_player('Angela')
    assert_equal(['Tom', 'Dick', 'Harry', 'Angela'], @sports_team.players)
  end

  def test_is_player__true
    assert_equal("YES! Tom is in the team.", @sports_team.is_player('Tom'))
  end

  def test_is_player__false
    assert_equal("NO! They\'re not in the team.", @sports_team.is_player('Alfred'))
  end

  def test_points__start
    assert_equal(0, @sports_team.points)
  end

  def test_points__did_win
    @sports_team.won?(true)
    assert_equal(1, @sports_team.points)
  end

  def test_points__didnt_win
    @sports_team.won?(false)
    assert_equal(0, @sports_team.points)
  end

  def test_points__2_wins
    @sports_team.won?(true)
    @sports_team.won?(true)
    assert_equal(2, @sports_team.points)
  end

end
