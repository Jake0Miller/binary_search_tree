class Node
  attr_reader :key, :val, :left, :right

  def initialize(key, val, left = nil, right = nil)
    @key = key
    @val = val
    @left = left
    @right = right
  end

  def insert(key, val)
    if key == @key
      return nil
    elsif key < @key
      @left.nil? ? @left = Node.new(key, val) : @left.insert(key, val)
    elsif key > @key
      @right.nil? ? @right = Node.new(key, val) : @right.insert(key, val)
    end
  end

  def sort
    if @left != nil && @right != nil
      @left.sort + [{@val => @key}] + @right.sort
    elsif @left != nil
      @left.sort + [{@val => @key}]
    elsif @right != nil
      [{@val => @key}] + @right.sort
    else
      [{@val => @key}]
    end
  end
end
