# frozen_string_literal: true

# knight piece
class Knight
  include Comparable
  attr_accessor :position, :zero, :one, :two, :three, :four, :five, :six, :seven

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
  end
end
