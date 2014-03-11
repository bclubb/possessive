# encoding: utf-8
require 'helper'

class InflectorTest < Test::Unit::TestCase
  test "Possessive with a normal string" do
    assert_equal "Brian’s", "Brian".possessive
    assert_equal "BRIAN’s", "BRIAN".possessive
  end

  test "Possessive with a string ending with s" do
    assert_equal "Steelers’", "Steelers".possessive
    assert_equal "STEELERS’", "STEELERS".possessive
  end

  test "Possessive with strings ending in sh" do
    assert_equal "fishes’", "fish".possessive
  end

  test "Possessive with strings ending in ss" do
    assert_equal "class’s", "class".possessive
  end

  test "Possessive with it" do
    assert_equal "its", "it".possessive
  end

  test "Possessive with something containing the string rule: 'it', 'its'" do
    assert_equal "little’s", "little".possessive
  end

  test "Possessive with an empty string" do
    assert_equal "", "".possessive
  end

  test "Possessive with localization" do
    Possessive::Inflector.inflections(:de) do |inflect|
      inflect.possessive /$/, 's'
      inflect.possessive /(s|x|z)$/i, '\1’'
    end

    assert_equal('Bachs', 'Bach'.possessive(:de))
    assert_equal('Bach’s', 'Bach'.possessive)

    assert_equal('Blitz’', 'Blitz'.possessive(:de))
    assert_equal('Blitz’s', 'Blitz'.possessive)

    assert_equal('Felix’', 'Felix'.possessive(:de))
    assert_equal('Felix’s', 'Felix'.possessive)

    assert_equal('Fuchs’', 'Fuchs'.possessive(:de))
    assert_equal('Fuchs’', 'Fuchs'.possessive)

    Possessive::Inflector.inflections(:de) { |inflect| inflect.clear }

    assert Possessive::Inflector.inflections(:de).possessives.empty?
    assert !Possessive::Inflector.inflections.possessives.empty?
  end

  test "clear rules" do
    with_dup do
      Possessive::Inflector.inflections do |inflect|
        # ensure any data is present
        inflect.possessive(/$/, '’s')

        inflect.clear

        assert inflect.possessives.empty?
      end
    end
  end

  # Dups the singleton and yields, restoring the original inflections later.
  # Use this in tests what modify the state of the singleton.
  #
  # This helper is implemented by setting @__instance__ because in some tests
  # there are module functions that access Possessive::Inflector.inflections,
  # so we need to replace the singleton itself.
  def with_dup
      original = Possessive::Inflector::Inflections.instance_variable_get(:@__instance__)
      Possessive::Inflector::Inflections.instance_variable_set(:@__instance__, original.dup)
    ensure
      Possessive::Inflector::Inflections.instance_variable_set(:@__instance__, original)
    end
end
