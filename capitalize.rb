require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @namable.correct_name.capitalize
  end
end