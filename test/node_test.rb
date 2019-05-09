require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test
  def setup
    @node = Node.new(61, "Bill & Ted's Excellent Adventure")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_has_attributes
    assert_equal 61, @node.key
    assert_equal "Bill & Ted's Excellent Adventure", @node.val
  end

  def test_left_right_start_nil
    assert_nil @node.left
    assert_nil @node.right
  end

  def test_insert
    @node.insert(92, "Sharknado 3")
    @node.insert(16, "Johnny English")

    assert_equal 16, @node.left.key
    assert_equal 92, @node.right.key
  end

  def test_comparison_operator
    node_mid = Node.new(15, "middle")
    node_top = Node.new(20, "top")
    node_bot = Node.new(10, "bottom")

    assert_equal 0, node_mid <=> node_mid
    assert_equal -1, node_mid <=> node_top
    assert_equal -1, node_bot <=> node_mid
    assert_equal 1, node_top <=> node_mid
    assert_equal 1, node_mid <=> node_bot
  end
end
