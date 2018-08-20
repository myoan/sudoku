module Sudoku
  class DataValidator
    def self.validate_x_axis_format!(data)
      data.each do |line|
        next if line.size == 9
        raise "InvalidFormat"
      end
    end

    def self.validate_y_axis_format!(data)
      return if data.size == 9
      raise "InvalidFormat"
    end

    def self.validate_data(data)
      return if data.join.match(/(\s|[1-9])/)
      raise "InvalidData"
    end
  end
end