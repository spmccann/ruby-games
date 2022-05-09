# frozen_string_literal: true

# knight piece
class Knight
  include Comparable
  attr_accessor :position, :left, :right

  def <=>(other)
    position <=> other.position
  end

  def initialize(position)
    @position = position
    @left = nil
    @right = nil
  end
end
