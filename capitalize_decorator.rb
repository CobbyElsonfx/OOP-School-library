require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.capitalize
  end
end
