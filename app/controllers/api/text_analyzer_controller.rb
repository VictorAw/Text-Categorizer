class Api::TextAnalyzerController < ApplicationController
  def index
    perceptron = Perceptron.new

    if(params['text'].empty)
      render json: ["Text can't be empty"], status: 404
    else
      text = params['text'] == 'random' ?
            TestingDatum.all[rand(TestingDatum.count)].body : params['text']
      result = perceptron.evaluate(text)

      render json: result
    end
  end
end
