# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

File.readlines('app/helpers/narrative.txt').each do |line|
  TrainingDatum.create(body: line.chomp, answer: 'Narrative')
end

File.readlines('app/helpers/expository.txt').each do |line|
  TrainingDatum.create(body: line.chomp, answer: 'Expository')
end

Neuron.create({
  category: "Expository",
  threshold: 0.5,
  learning_rate: 0.03,
  weights: {
    numbers: -0.32085629484973976,
    pronouns: -0.9636987936816868,
    names: -0.20039731538430472,
    quotes: 0.032096526454528596,
    adverbs: -0.15094732314310377,
    adjectives: -0.08747721751332477,
    commas: -0.15507517470256338,
    _bias: 0.6200000000000001
    }
  }
)

Neuron.create({
  category: "Narrative",
  threshold: 0.5,
  learning_rate: 0.03,
  weights: {
    numbers: 0.4368918087905634,
    pronouns: 1.2499323833033908,
    names: 0.27254575020485317,
    quotes: 0.12973853875386304,
    adverbs: 0.1457836437845828,
    adjectives: 0.14966972344199872,
    commas: 0.2303422678764705,
    _bias: 0.3799999999999999
    }
  }
)
