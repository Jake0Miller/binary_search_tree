require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/node_generator'

class NodeGeneratorTest < MiniTest::Test
  def setup
    @node_gen = NodeGenerator.new('./movies.txt')
    @nodes = @node_gen.create_nodes
  end

  def test_it_exists
    assert_equal 71, @nodes[0].key
    assert_equal "Hannibal Buress: Animal Furnace", @nodes[0].val
    assert_equal 99, @nodes.length
  end
end
