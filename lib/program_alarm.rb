# read first thing, opcode 1 (add)
#   we'll need to look ahead to the next 2 positions. to get the "addresses" to add
#   9 and 10,
#   Now we'll find the values at addresses 9 & 10
#   values are 30 and 40 respectively.

# We next read the address where we'll put the result.
#   3 so we'll put the result of our add into address 3.

# Add our values get 70, then store it at position 3 ( 0, 1, 2, 3 )

class Program_Alarm

  @codes = []
  @offset = 0

  def process(program_input)
    @codes = program_input.split(',')
    @offset = 0

    while @offset < @codes.count

      opcode = @codes[@offset].to_i

      if opcode == 99
        return @codes.join(',')
      end

      updated_value = compute(opcode, @offset)
      result_address = fetch_result_address(@offset)

      @codes[result_address] = updated_value
      @offset += 4
    end
  end

  private

  def compute(opcode, offset)
    address1, address2 = fetch_addresses(offset)
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

  def fetch_addresses(offset)
    address1 = @codes[offset + 1].to_i
    address2 = @codes[offset + 2].to_i
    [address1, address2]
  end

  def fetch_result_address(offset)
    @codes[offset + 3].to_i
  end
end
