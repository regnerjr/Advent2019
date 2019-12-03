# frozen_string_literal: true

# Fuel required to launch a given module is based on its mass. Specifically, to
# find the fuel required for a module, take its mass, divide by three, round
# down, and subtract 2.

# For example:

# For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get
# 2. For a mass of 14, dividing by 3 and rounding down still yields 4, so the
# fuel required is also 2. For a mass of 1969, the fuel required is 654. For a
# mass of 100756, the fuel required is 33583. The Fuel Counter-Upper needs to
# know the total fuel requirement. To find it, individually calculate the fuel
# needed for the mass of each module (your puzzle input), then add together all
# the fuel values.

# What is the sum of the fuel requirements for all of the modules on your
# spacecraft?

class FuelCounter
  def count(mass)
    (mass / 3).floor - 2
  end
end

class RecursiveFuelCounter
  def count(mass)
    fuel_counter = FuelCounter.new
    final_fuel = 0
    inital = fuel_counter.count(mass)
    final_fuel += inital
    new_mass = inital
    while new_mass.positive?
      new_mass = fuel_counter.count(new_mass)
      if new_mass.positive?
        final_fuel += new_mass
      else
        new_mass = 0
      end
    end
    final_fuel
  end
end
