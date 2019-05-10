require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'

class HealthTest < MiniTest::Test
  def setup
    @tree = BinarySearchTree.new
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")
  end

  def test_it_returns_array
    assert_instance_of Array, @tree.health(0)
  end

  def test_return_array_first_elements
    assert_equal 98, @tree.health(0)[0][0]
    assert_equal 58, @tree.health(1)[0][0]
    assert_equal 36, @tree.health(2)[0][0]
    assert_equal 93, @tree.health(2)[1][0]
  end

  def test_full_return_array
    assert_equal [[98, 7, 100]], @tree.health(0)
    assert_equal [[58, 6, 85]], @tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @tree.health(2)
  end

  def test_leaves
    assert_equal 2, @tree.leaves
  end

  def test_height
    assert_equal 5, @tree.height
  end

  def test_delete_bad_keys
    assert_nil @tree.delete(101)
    assert_nil @tree.delete(30)
  end

  def test_delete_key
    assert_equal 38, @tree.delete(38)
    assert_equal 69, @tree.delete(69)
    assert_equal 58, @tree.delete(58)
  end
end
