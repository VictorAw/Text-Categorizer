# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

File.readlines('app/helpers/narrative.txt').each do |line|
  TrainingDatum.create(body: line.chomp, answer: 'narrative')
end

File.readlines('app/helpers/expository.txt').each do |line|
  TrainingDatum.create(body: line.chomp, answer: 'expository')
end

Neuron.create({
  category: "Expository",
  threshold: 0.5,
  learning_rate: 0.1,
  weights: {
    numbers: 0.5,
    pronouns: 0.5,
    names: 0.5,
    quotes: 0.5,
    adverbs: 0.5,
    adjectives: 0.5,
    commas: 0.5,
    _bias: 0.5
    }
  })

Neuron.create({
  category: "Narrative",
  threshold: 0.5,
  learning_rate: 0.1,
  weights: {
    numbers: 0.5,
    pronouns: 0.5,
    names: 0.5,
    quotes: 0.5,
    adverbs: 0.5,
    adjectives: 0.5,
    commas: 0.5,
    _bias: 0.5
    }
  })
