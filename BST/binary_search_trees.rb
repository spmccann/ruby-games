# frozen_string_literal: true

# node for balanced binary search tree
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def <=>(other)
    data <=> other.data
  end

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# tree
class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    nil if array.nil?
    mid = array.length / 2
    root = Node.new(array[mid])
    if array.length > 2
      root.left = build_tree(array[0..mid])
      root.right = build_tree(array[mid..-1])
      root
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

birch = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

birch.pretty_print
