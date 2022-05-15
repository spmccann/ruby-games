# frozen_string_literal: true

# knight piece
class Tree
  include Comparable
  attr_accessor :position, :one, :two, :three, :four, :five, :six

  def <=>(other)
    position <=> other.position
  end

  def initialize(position)
    @position = position
    @one = []
    @two = []
    @three = []
    @four = []
    @five = []
    @six = []
  end
end
