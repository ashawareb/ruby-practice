# Classes witch are used in factory
class Rectangle
  # Implementation
end

class Square
  # Implementation
end

class Circle
  # Implementation
end

# Factory
class ShapeFactory
  def get_shape(type)
    case type
    when :rectangle then Rectangle.new
    when :square then Square.new
    when :circle then Circle.new
    end
  end
end

# Usage

shape_factory = ShapeFactory.new
square = shape_factory.get_shape :square
