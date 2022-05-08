# frozen_string_literal: true

# tree
class Tree
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.sort.uniq
    return nil unless array

    mid = array.length / 2
    return Node.new(array[mid - 1]) if array.length < 2

    root = Node.new(array[mid])
    root.left = build_tree(array[0..mid - 1])
    root.right = build_tree(array[mid + 1..-1])
    root
  end

  def insert(key, node = @root)
    node = Node.new(key) if node.nil?
    if node.data == key
      node
    elsif node.data < key
      node.right = insert(key, node.right)
    else
      node.left = insert(key, node.left)
    end
    node
  end

  def delete(key, node = @root)
    if node.nil?
      'key not found'
    elsif node.data < key
      node.right = delete(key, node.right)
    elsif node.data > key
      node.left = delete(key, node.left)
    elsif node.data == key
      node = nil
    end
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
