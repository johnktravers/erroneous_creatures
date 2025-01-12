gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/medusa'

class MedusaTest < Minitest::Test
  def setup
    @medusa = Medusa.new("Cassiopeia")
    @victim = Person.new("Perseus")
  end

  def test_it_has_a_name
    assert_equal "Cassiopeia", @medusa.name
  end

  def test_can_stare
    assert @medusa.respond_to?(:stare)
  end

  def test_has_statues
    assert @medusa.respond_to?(:statues)
  end

  def test_when_first_created_she_has_no_statues
    assert @medusa.statues.empty?
  end

  def test_when_staring_at_a_person_she_gains_a_statue
    @medusa.stare(@victim)

    assert_equal 1, @medusa.statues.count
    assert_equal "Perseus", @medusa.statues.first.name
  end

  def test_when_staring_at_a_person_that_person_turns_to_stone
    refute @victim.stoned?

    @medusa.stare(@victim)

    assert @victim.stoned?
  end

end
