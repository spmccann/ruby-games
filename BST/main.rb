# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

birch = Tree.new([1, 2, 3, 4, 5, 6, 7])
birch.insert(8)
birch.delete(6)
birch.pretty_print
