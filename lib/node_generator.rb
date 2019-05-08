class NodeGenerator
  def initialize(file)
    @file = file
    @nodes = create_nodes
  end

  def create_nodes
    nodes = []
    IO.foreach(@file) do |line|
      split_line = line.chomp.split(",")
      split_line[0] = split_line[0].to_i
      split_line[1] = split_line[1][1..-1]
      nodes << Node.new(split_line[0],split_line[1])
    end
    nodes
  end
end
