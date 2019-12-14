# frozen_string_literal: true

require 'minitest/pride'
require_relative 'test_helper'
require 'program_alarm'

class ProgramAlarmTest < Minitest::Test
  def test_example_1
    alarm = ProgramAlarm.new
    program = '1,9,10,3,2,3,11,0,99,30,40,50'
    result = alarm.process(program)
    expected = '3500,9,10,70,2,3,11,0,99,30,40,50'
    assert_equal(expected, result)
  end

  def test_example_2
    alarm = ProgramAlarm.new
    program = '1,0,0,0,99'
    result = alarm.process(program)
    expected = '2,0,0,0,99'
    assert_equal(expected, result)
  end

  def test_example_3
    alarm = ProgramAlarm.new
    program = '2,3,0,3,99'
    result = alarm.process(program)
    expected = '2,3,0,6,99'
    assert_equal(expected, result)
  end

  def test_example_4
    alarm = ProgramAlarm.new
    program = '2,4,4,5,99,0'
    result = alarm.process(program)
    expected = '2,4,4,5,99,9801'
    assert_equal(expected, result)
  end

  def test_example_5
    alarm = ProgramAlarm.new
    program = '1,1,1,4,99,5,6,0,99'
    result = alarm.process(program)
    expected = '30,1,1,4,2,5,6,0,99'
    assert_equal(expected, result)
  end
end
