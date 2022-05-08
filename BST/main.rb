# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

birch = Tree.new([1, 2, 3, 4, 5, 6, 7])
#birch.insert(8)
# birch.delete(1)
# birch.find(4)
# birch.level_order
# birch.inorder
# birch.preorder
# birch.postorder
# birch.height
birch.depth(4)
birch.pretty_print
