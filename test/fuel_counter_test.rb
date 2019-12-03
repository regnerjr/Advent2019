# frozen_string_literal: true

require 'minitest/pride'
require_relative 'test_helper'
require 'fuel_counter'

class FuelCounterTest < Minitest::Test
  def test_mass_12_gives_2_fuel
    fuel_counter = FuelCounter.new
    req = fuel_counter.count(12)
    assert_equal(2, req)
  end

  def test_mass_1969_gives_654_fuel
    fuel_counter = FuelCounter.new
    req = fuel_counter.count(1969)
    assert_equal(654, req)
  end

  def test_mass_100756_gives_33583_fuel
    fuel_counter = FuelCounter.new
    req = fuel_counter.count(100_756)
    assert_equal(33_583, req)
  end
end

class RecursiveFuelCounterTest < Minitest::Test
  def test_mass_14_gives_2_fuel
    fuel_counter = RecursiveFuelCounter.new
    req = fuel_counter.count(14)
    assert_equal(2, req)
  end

  def test_mass_1969_gives_966_fuel
    fuel_counter = RecursiveFuelCounter.new
    req = fuel_counter.count(1969)
    assert_equal(966, req)
  end
end
