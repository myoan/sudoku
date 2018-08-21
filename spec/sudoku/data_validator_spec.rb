require "rspec"

RSpec.describe Sudoku::DataValidator do
  describe ".validate_format!" do
    subject { Sudoku::DataValidator.validate_format!(data) }

    context "when line size less than 81" do
      let(:data) { Array.new(80) { "1" }.join }
      it { expect { subject }.to raise_error Exception }
    end

    context "when line size eq 9" do
      let(:data) { Array.new(81) { "1" }.join }
      it { expect { subject }.not_to raise_error }
    end

    context "when line size greater than 9" do
      let(:data) { Array.new(82) { "1" }.join }
      it { expect { subject }.to raise_error Exception }
    end
  end

  describe ".validate_data!" do
    subject { Sudoku::DataValidator.validate_data!(data) }
    context "exist whitespace" do
      let(:data) { [" "] }
      it { expect { subject }.not_to raise_error }
    end

    context "exist number (not zero)" do
      let(:data) { ["123456789"] }
      it { expect { subject }.not_to raise_error }
    end

    context "exist zero" do
      let(:data) { ["0"] }
      it { expect { subject }.to raise_error Exception }
    end

    context "exist charactor" do
      let(:data) { ["a"] }
      it { expect { subject }.to raise_error Exception }
    end
  end
end