require "net/http"

class TextAnalyzer
  attr_reader :statistics

  def initialize
    @statistics = {
      numbers: 0,
      titles: 0,
      pronouns: 0,
      names: 0,
      quotation_marks: 0,
      adverbs: 0,
      adjectives: 0
    }
  end

  def analyze_text(text)
    reset_statistics
    
    @parts_of_speech = get_parts_of_speech(text)
    @tokens = text.split
    @tokens.each do |token, i|
      
    end


    @statistics
  end

  def get_parts_of_speech(text)
    Net::HTTP.get(   
  end
end
