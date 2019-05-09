class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @num_nodes = 0
  end

  def insert(key, title)
    return 0 if set_root_node_if_nil?(key,title)
    return nil if @root.insert(key, title).nil?
    @num_nodes += 1
    return depth_of(key)
  end

  def set_root_node_if_nil?(key, title)
    if @root.nil?
      @root = Node.new(key, title)
      @num_nodes += 1
      return true
    end
  end

  def include?(key)
    return false if is_score_invalid?(key)
    cur_node = @root
    while cur_node != nil  && cur_node.key != key
      cur_node = find_node(cur_node, key)
    end
    return true if cur_node != nil
  end

  def find_node(cur_node, key)
    if key < cur_node.key
      return cur_node.left
    else
      return cur_node.right
    end
  end

  def is_score_invalid?(key)
    key < 0 || key > 100
  end

  def depth_of(key)
    depth = 0
    cur_node = @root
    while cur_node != nil && cur_node.key != key
      cur_node = find_node(cur_node, key)
      depth += 1
    end
    cur_node.nil? ? nil : depth
  end

  def max
    cur_node = @root
    while cur_node.right
      cur_node = cur_node.right
    end
    {cur_node.val => cur_node.key}
  end

  def min
    cur_node = @root
    while cur_node.left
      cur_node = cur_node.left
    end
    {cur_node.val => cur_node.key}
  end

  def sort
    @root.sort
  end

  def health(depth)
    nodes = get_all_nodes_at_depth(depth)
    results = []
    nodes.each do |ele|
      num_nodes_below = count_nodes_below_node(ele)
      results << [ele.key, num_nodes_below, (100 * num_nodes_below.to_f / @num_nodes).to_i]
    end
    results
  end

  def enqueue(queue, cur_node)
    queue.push(cur_node.left) if cur_node.left != nil
    queue.push(cur_node.right) if cur_node.right != nil
    cur_node = queue.shift
    [queue, cur_node]
  end

  def count_nodes_below_node(node)
    cur_node = node
    queue = []
    count_nodes = 0
    while cur_node != nil
      queue, cur_node = enqueue(queue, cur_node)
      count_nodes += 1
    end
    count_nodes
  end

  def get_all_nodes_at_depth(depth)
    nodes = []
    queue = []
    cur_node = @root
    while cur_node != nil
      nodes.push(cur_node) if depth_of(cur_node.key) == depth
      queue, cur_node = enqueue(queue, cur_node)
    end
    nodes
  end

  def leaves
    leaf_count = 0
    queue = []
    cur_node = @root
    while cur_node != nil
      leaf_count += 1 if cur_node.left == nil && cur_node.right == nil
      queue, cur_node = enqueue(queue, cur_node)
    end
    leaf_count
  end

  def height
    get_sub_height(@root)
  end

  def get_sub_height(cur_node)
    left_height = cur_node.left ? get_sub_height(cur_node.left) : 0
    right_height = cur_node.right ? get_sub_height(cur_node.right) : 0
    1 + [left_height, right_height].max
  end
end
