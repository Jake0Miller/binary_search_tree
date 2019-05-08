class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(key, title)
    return 0 if set_root_node_if_nil?(key,title)
    return nil if @root.insert(key, title).nil?
    return depth_of(key)
  end

  def set_root_node_if_nil?(key, title)
    if @root.nil?
      @root = Node.new(key, title)
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
end
