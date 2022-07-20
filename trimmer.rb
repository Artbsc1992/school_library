require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @namable.correct_name[0, 10]
  end
end