require "test_helper"
require "numberator"

class NumberatorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Numberator::VERSION
  end

  def test_numbers_provider
    io = StringIO.new("das 1efa 21aa 10 zz;z; 777a")
    np = Numberator::NumbersProvider.new(io)
    nums = np.enum_for(:each_number).to_a
    assert_equal(4, nums.size)
    assert_equal("1 21 10 777", nums * " ")
  end

  def test_numbers_ordered_list
    nl = Numberator::NumbersOrderedList.new(2)
    [2, 2321, 1, 33].map {|x| nl << x }
    nums = nl.enum_for(:each_number).to_a
    assert_equal(2, nums.size)
    assert_equal("2321 33", nums * " ")
  end
end
