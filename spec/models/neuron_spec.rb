require "rails_helper"

RSpec.describe Neuron, type: :model do
  # Later on, replace this with a more general method
  let(:vals) {
    {
      numbers: 1,
      pronouns: 1,
      names: 1,
      quotes: 1,
      adverbs: 1,
      adjectives: 1,
      commas: 1,
      _bias: 1
    }
  }

  let(:fire_settings) {
    {
      category: "Fire",
      threshold: 0,
      learning_rate: 0.1,
      weights: {
        numbers: 1,
        pronouns: 1,
        names: 1,
        quotes: 1,
        adverbs: 1,
        adjectives: 1,
        commas: 1,
        _bias: 1
      }
    }
  }

  let(:no_fire_settings) {
    {
      category: "No Fire",
      threshold: 1,
      learning_rate: 0.1,
      weights: {
        numbers: 0,
        pronouns: 0,
        names: 0,
        quotes: 0,
        adverbs: 0,
        adjectives: 0,
        commas: 0,
        _bias: 0
      }
    }
  }

  it { should validate_presence_of :category }
  it { should validate_presence_of :threshold }
  it { should validate_presence_of :learning_rate }
  it { should validate_presence_of :weights }

  describe "#fired" do
    it "should fire correctly" do
      fired = Neuron.create!(fire_settings)
      expect(fired.fired(vals)).to be true

      non_fired = Neuron.create!(no_fire_settings)
      expect(non_fired.fired(vals)).to be false
    end
  end

  describe "#update_weights" do
    it "should update the weights"

    it "should write to the database"
  end

  describe "#check_weights" do
    it "should record statistics correctly"
  end

  describe "#reset_statistics" do
    it "should reset statistics"
  end
end
