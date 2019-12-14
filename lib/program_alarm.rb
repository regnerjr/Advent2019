# read first thing, opcode 1 (add)
#   we'll need to look ahead to the next 2 positions. to get the "addresses" to add
#   9 and 10,
#   Now we'll find the values at addresses 9 & 10
#   values are 30 and 40 respectively.

# We next read the address where we'll put the result.
#   3 so we'll put the result of our add into address 3.

# Add our values get 70, then store it at position 3 ( 0, 1, 2, 3 )

class ProgramAlarm
  @codes = []
  @instruction_pointer = 0

  def process(program_input)
    @codes = program_input.split(',')
    @instruction_pointer = 0

    while @instruction_pointer < @codes.count

      opcode = @codes[@instruction_pointer].to_i
      return @codes.join(',') if opcode == 99

      updated_value = compute(opcode, @instruction_pointer)
      result_address = fetch_result_address(@instruction_pointer)

      @codes[result_address] = updated_value
      @instruction_pointer += 4
    end
  end

  private

  def compute(opcode, instruction_pointer)
    address1, address2 = fetch_addresses(instruction_pointer)
    value1, value2 = extract_values(address1, address2)

    case opcode
    when 1 # add
      updated_value = (value1 + value2)
    when 2 # multiply
      updated_value = (value1 * value2)
    end
    updated_value
  end

  def extract_values(address1, address2)
    value1 = @codes[address1].to_i
    value2 = @codes[address2].to_i
    [value1, value2]
  end

  def fetch_addresses(instruction_pointer)
    address1 = @codes[instruction_pointer + 1].to_i
    address2 = @codes[instruction_pointer + 2].to_i
    [address1, address2]
  end

  def fetch_result_address(instruction_pointer)
    @codes[instruction_pointer + 3].to_i
  end
end
