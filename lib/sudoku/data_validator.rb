module Sudoku
  class DataValidator
    def self.validate!(data)
      self.validate_format!(data)
      self.validate_data!(data)
    end

    def self.validate_format!(data)
      return if data.size == 81
      raise "InvalidFormat"
    end

    def self.validate_data!(data)
      return if data.match(/(\s|[1-9]|x)/)
      raise "InvalidData"
    end
  end
end