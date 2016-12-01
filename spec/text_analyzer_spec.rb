require "rails_helper"

RSpec.describe TextAnalyzer do
  let (:text_analyzer) {TextAnalyzer.new}

  describe "#initialize" do
    it "should initialize with the right weights" do

      expect(text_analyzer.statistics).to eq({
        numbers: 0,
        pronouns: 0,
        names: 0,
        quotes: 0,
        adverbs: 0,
        adjectives: 0,
        commas: 0
      })
    end
  end

  describe "#analyze_text" do
    it "should change the statistics properly" do
      text_analysis = text_analyzer.analyze_text("Perhaps it was because he was now so busy, what with Quidditch practice three evenings a week on top of all his homework, but Harry could hardly believe it when he realized that he'd already been at Hogwarts two months. The castle felt more like home than Privet Drive ever had. His lessons, too, were")
      answer = {:numbers=>0.03278688524590164,
               :pronouns=>0.11475409836065574,
               :names=>0.04918032786885246,
               :quotes=>0.0,
               :adverbs=>0.13114754098360656,
               :adjectives=>0.01639344262295082,
               :commas=>0.06557377049180328}

      expect(text_analysis).to eq(answer)
    end
  end

  describe "#reset_statistics" do
    it "should reset the statistics" do
      text_analysis = text_analyzer.analyze_text("Perhaps it was because he was now so busy")
      text_analyzer.reset_statistics

      expect(text_analyzer.statistics).to eq({
        numbers: 0,
        pronouns: 0,
        names: 0,
        quotes: 0,
        adverbs: 0,
        adjectives: 0,
        commas: 0
      })
    end
  end
end
