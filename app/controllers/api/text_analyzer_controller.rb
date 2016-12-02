class Api::TextAnalyzerController < ApplicationController
  def index
    perceptron = Perceptron.instance

    if(params['text'].empty?)
      render json: ["Text can't be empty"], status: 404
    else
      text = params['text'] == 'random' ?
          TrainingDatum.all[rand(TrainingDatum.count)].body : params['text']
      result = perceptron.evaluate(text)

      render json: [result, text]
    end
  end
end
