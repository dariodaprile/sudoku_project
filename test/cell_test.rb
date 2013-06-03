require 'minitest/spec'
require 'minitest/autorun'
require '../lib/cell'

describe Cell do
  before do
    @finalized_cell = Cell.new("2")
    @non_finalized_cell = Cell.new("0")
  end

  it "should have a read only array of possible values" do
    @finalized_cell.must_respond_to :possible_values
    @finalized_cell.wont_respond_to :possible_values=
    @finalized_cell.possible_values.must_be_instance_of Array
  end

  it "should have an array of possible values from 1 to 9 when the initialized value is 0" do
    @non_finalized_cell.possible_values.must_equal ["1","2","3","4","5","6","7","8","9"]
  end

  describe "calculate_possible_values method" do
    it "should accept three arrays of numbers and remove the numbers in those arrays from the array of possible_values" do
      array1 = ["1","2"]
      array2 = ["3","4"]
      array3 = ["4","5","6"]
      @non_finalized_cell.calculate_possible_values(array1, array2, array3).must_equal ["7","8","9"]
      @non_finalized_cell.possible_values.must_equal ["7","8","9"]
    end
  end

  it "should be finalized if it has only one possible value" do
    @finalized_cell.possible_values.count.must_equal 1
    @finalized_cell.finalized?.must_equal true
  end

  it "should not be finalized if it has more than one possible value" do
    @non_finalized_cell.possible_values.count.must_equal 9
    @non_finalized_cell.possible_values.must_equal ["1","2","3","4","5","6","7","8","9"]
    @non_finalized_cell.finalized?.must_equal false
  end

  describe "to_s method" do
    it "should return a string containing the value of teh cell when finalized" do
      @finalized_cell.to_s.must_equal "2"
    end

    it "should return '*' when there are multiple possible_values" do
      @non_finalized_cell.to_s.must_equal "*"
    end
  end

  it "should respond to '==' '!=' >=' '<=' '<' '>'" do
    @finalized_cell.must_respond_to :==
    @finalized_cell.must_respond_to :>=
    @finalized_cell.must_respond_to :<=
    @finalized_cell.must_respond_to :>
    @finalized_cell.must_respond_to :<
  end

  describe "<=>" do
    it "should return -1 if the cell on the left has fewer possible values" do
      @finalized_cell.<=>(@non_finalized_cell).must_equal -1
    end

    it "should return 1 if the cell on the left has more possible values" do
      @non_finalized_cell.<=>(@finalized_cell).must_equal 1
    end

    it "should return 0 if both cells have more than one possible value but have the same number of possible values" do
      @non_finalized_cell.<=>(@non_finalized_cell).must_equal 0
      @finalized_cell.<=>(@finalized_cell).must_equal 0
    end

  end

  it "should (if required to do so) pick a value randomly from the remaining possible values and consequently should then be finalized" do
    @non_finalized_cell.possible_values.must_include @non_finalized_cell.pick_a_value!.first
    @non_finalized_cell.possible_values.count.must_equal 1
    @non_finalized_cell.finalized?.must_equal true
  end

end