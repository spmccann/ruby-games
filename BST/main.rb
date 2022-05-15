# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

array = (Array.new(15) { rand(1..100) })

birch = Tree.new(array)
birch.balanced?
birch.preorder
birch.inorder
birch.postorder
birch.insert(500)
birch.insert(300)
birch.insert(200)
birch.rebalance
birch.balanced?
birch.preorder
birch.inorder
birch.postorder

# birch.delete(1)
# birch.find(4)
# birch.level_order
# birch.height
# birch.depth(4)

birch.pretty_print
