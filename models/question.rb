class Question
  attr_reader :question, :season, :episode

  def initialize(attributes)
    @question = attributes[:question]
    @season = attributes[:season]
    @episode = attributes[:episode]
  end

end
