# frozen_string_literal: true

# node for balanced binary search tree
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def <=>(other)
    data <=> other.data
  end

  def initialize(data, left, right)
    @data = data
    @left = left
    @right = right
  end
end

# tree
class Tree
  attr_accessor :array, :root

  def initialize
    @array = []
    @root = build_tree
  end

  def build_tree(data)
    'empty' if data.nil?
    data.uniq!
  end
end
