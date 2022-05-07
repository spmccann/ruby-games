# frozen_string_literal: true

# tree
class Tree
  def initialize(array)
    array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil unless array
    mid = array.length / 2
    return root = Node.new(array[mid-1]) if array.length < 2
    root = Node.new(array[mid])
    root.left = build_tree(array[0..mid - 1])
    root.right = build_tree(array[mid + 1..-1]) 
    p root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
