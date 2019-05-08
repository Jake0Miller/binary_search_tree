require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'

class BinarySearchTreeTest < MiniTest::Test
  def setup
    @tree = BinarySearchTree.new
    @res1 = @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @res2 = @tree.insert(16, "Johnny English")
    @res3 = @tree.insert(92, "Sharknado 3")
    @res4 = @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_insert_first_node
    assert_equal 0, @res1
  end

  def test_includes_illegal_node
    refute @tree.include?(101)
  end

  def test_includes_first_node
    assert @tree.include?(61)
  end

  def test_includes_empty_node
    refute @tree.include?(1)
  end

  def test_insert_returns_nil_if_key_exists
    @tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_nil @tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_inserts_all_nodes
    assert_equal 0, @res1
    assert_equal 1, @res2
    assert_equal 1, @res3
    assert_equal 2, @res4
  end

  def test_depth_empty_node
    assert_nil @tree.depth_of(5)
  end

  def test_max_returns_max
    expected = {"Sharknado 3" => 92}

    assert_equal expected, @tree.max
  end

  def test_min_returns_min
    expected = {"Johnny English" => 16}

    assert_equal expected, @tree.min
  end

  def test_sort
    expected = [{"Johnny English"=>16},
        {"Hannibal Buress: Animal Furnace"=>50},
        {"Bill & Ted's Excellent Adventure"=>61},
        {"Sharknado 3"=>92}]
    assert_equal expected, @tree.sort
  end
end
