# frozen_string_literal: true

# tree
class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    mid = array.length / 2
    if array.length > 2
      root = Node.new(array[mid])
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