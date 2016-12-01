class TrainingValue < ApplicationRecord
  # Assuming that identical values will not be helpful in training
  # the neurons
  validates :values, uniqueness: true, presence: true
  validates :answer, presence: true

  def get_values
    values = {}
    self.values.each_key do |k|
      values[k.to_sym] = self.values[k].to_f
    end

    values
  end

  def self.extract_training_values
    text_analyzer = TextAnalyzer.new
    TrainingDatum.all.each do |data|
      text_characteristics = text_analyzer.analyze_text(data.body)
      text_characteristics[:_bias] = 1.0

      TrainingValue.create({
        values: text_characteristics,
        answer: data.answer
      })
    end
  end
end
