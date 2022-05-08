# frozen_string_literal: true

# tree
class Tree
  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.sort.uniq
    return nil unless array[0]

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

  def min_value_node(node = @root)
    current = node
    current = current.left while current.left
    current
  end

  def delete(key, node = @root)
    return puts 'key not found' unless @array.include?(key)

    if node.data < key
      node.right = delete(key, node.right)
    elsif node.data > key
      node.left = delete(key, node.left)
    elsif node.data == key && node.left.nil? && node.right.nil?
      node = nil
    elsif node.data == key && node.left
      temp = min_value_node(node.right)
      node.data = temp.data
      node.right = delete(temp.data, node.right)
    end
    node
  end

  def find(key, node = @root)
    return puts 'key not found' unless @array.include?(key)

    if node.data < key
      node.right = find(key, node.right)
    elsif node.data > key
      node.left = find(key, node.left)
    else
      puts node
    end
    node
  end

  def level_order(node = @root, queue = [])
    p node.data
    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  def inorder(node = @root, out = [])
    unless node.nil?
      inorder(node.left, out)
      out.push(node.data)
      inorder(node.right, out)
    end
    p out
  end

  def preorder(node = @root)
    return if node.nil?

    p node.data
    preorder(node.left)
    preorder(node.right)
  end

  def postorder(node = @root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    p node.data
  end

  def height(node = @root)
    if node.nil?
      -1
    else
      node = find(node) if node.is_a?(Integer)
      left = height(node.left)
      right = height(node.right)
      if left > right
        hgt = 1 + left
      else
        hgt = 1 + right
      end
      p hgt
    end
  end

  def depth(key, node = @root, hgt = 0)
    return puts 'key not found' unless @array.include?(key)

    if node.data < key
      hgt += 1
      node.right = depth(key, node.right, hgt)
    elsif node.data > key
      hgt += 1
      node.left = depth(key, node.left, hgt)
    else
      puts hgt + 1
    end
    node
  end

  def balanced?(node = @root, left = 1, right = 1)
    return if node.nil?

    left += 1 if balanced?(node.left, left, right)
    right += 1 if balanced?(node.right, left, right)
    if (left - right).abs < 2
      puts true
    else
      puts false
    end
  end

  def rebalance(node = @root)
    array = inorder(node)
    @root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
