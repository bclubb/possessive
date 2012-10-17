# encoding: utf-8

require 'helper'

class TestPossessive < Test::Unit::TestCase
  test "Possessive with a normal string" do
    assert_equal "Brian’s", "Brian".possessive
  end

  test "Possessive with a string ending with s" do
    assert_equal "Steelers’", "Steelers".possessive
  end
end
