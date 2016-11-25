require 'neuron'
require 'text_analyzer'

class Perceptron
  # For reference
  CATEGORIES = ['Expository', 'Narrative']

  def initialize()
    @fails = 0
    @correct = 0
    @misfires = 0

    @neurons = Neuron.all
    @data = []
    @text_analyzer = TextAnalyzer.new
  end

  def clear_data()
    @data = []
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
