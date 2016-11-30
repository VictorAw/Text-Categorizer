class Api::TextAnalyzerController < ApplicationController
  def index
    perceptron = Perceptron.new

    if(params['text'].empty?)
      render json: ["Text can't be empty"], status: 404
    else
      # change below from training to testing datum later
      text = params['text'] == 'random' ?
          TrainingDatum.all[rand(TrainingDatum.count)].body : params['text']
      # result = perceptron.evaluate(text)
      #
      # render json: result

      render json: [text]
    end
  end
end
