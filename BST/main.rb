# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

birch = Tree.new([1, 2, 3, 4, 5, 6])
birch.insert(7)
birch.delete(4)
birch.pretty_print
