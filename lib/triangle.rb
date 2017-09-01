require 'pry'

class Triangle

  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def valid?
    sorted = self.sides.sort
    if sorted.any? {|side| side <= 0}
      false
    else
      sorted[0] + sorted [1] <= sorted[2] ? false : true
    end
  end

  def check_type
    sorted = self.sides.sort
    if sorted[0] == sorted[2]
      :equilateral
    elsif sorted[1] == sorted[2] || sorted[0] == sorted[1]
      :isosceles
    else
      :scalene
    end
  end

  def kind
    if self.valid?
      self.check_type
    else
      begin
        raise TriangleError
      end
    end


  end



end


class TriangleError < StandardError
  def message
    "Invalid Triangle"
  end

end
