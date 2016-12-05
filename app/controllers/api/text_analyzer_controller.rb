class Api::TextAnalyzerController < ApplicationController
  def index
    perceptron = Perceptron.instance

    if(params['text'].empty?)
      render json: ["Text can't be empty"], status: 404
    elsif(params['text'] == 'random')
      render json: [TrainingDatum.all[rand(TrainingDatum.count)].body]
    else
      result = perceptron.evaluate(params['text'])

      render json: result
    end
  end
end
