require '../models/neuron'
require '../models/testing_datum'
require '../models/training_datum'
require 'text_analyzer'


class Perceptron
  # For reference
  CATEGORIES = ['Expository', 'Narrative']
  WEIGHTS = [:numbers, :pronouns, :names, :quotes, :adverbs, :adjectives, :commas, :_bias]

  def initialize()
    @fails = 0
    @correct = 0
    @misfires = 0

    @neurons = Neuron.all
    @text_analyzer = TextAnalyzer.new
  end

# Code has some data that needs to increment here. Ask clarification on those
  def train_neurons()
    TrainingDatum.all.each do |data|
      statistics = @text_analyzer.analyze_text(data.body)
      @neurons.each do |neuron|
        neuron.update_weights(statistics, data.answer)
      end
    end
  end

  def test_neurons()
    TestingDatum.all.each do |data|
      statistics = @text_analyzer.analyze_text(data.body)
      @neurons.each do |neuron|
        neuron.check_weights(statistics, data.answer)
      end
    end
  end

  def statistics
    @neurons.each do |neuron|
      @misfires += neuron.misfires
      @fails += neuron.fails
      @correct = neuron.correct
    end

    return {
      misfires: @misfires,
      fails: @fails,
      correct: @correct
    }
  end
end