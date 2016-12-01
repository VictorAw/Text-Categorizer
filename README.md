# Text-Categorizer

[Live Site][heroku]
[heroku]: https://text-categorizer.herokuapp.com/

Created by

[Shaurya Sinha][shaurya] and [Victor Aw][victor]
[shaurya]: https://github.com/shaurya157
[victor]: https://github.com/VictorAw

A neural net that categorizes a provided text excerpt.
The neural net will initially only categroize a text into one of two categories: Expository or Narrative.

## Screenshots


## Functionality and MVP

The neural net will be able to:
- [ ] Be trained using training data
- [ ] \(Mostly) Accurately identify whether a text is descriptive or narrative after being trained
- [ ] Be accessed through an API endpoint
- [ ] Be accessed through a Javascript frontend

## Training Data

The neural net will be trained on wikipedia exerpts and novel exerpts

## API Endpoints

### JSON API

#### Show

- GET /api/nerual\_net/

## Wireframes

![Front End](docs/wireframes/front-end.jpg)

## Technologies and Technical Challenges

- Javascript/HTML
- Algorithmia API to access Stanford Core NLP through HTML requests
- Standford Core NLP to identify parts of speech
- N-gram counter

Challenges of the project include:

- Deciding how to reduce a text excerpt into inputs for the nerual net
- Extracting the information required from the text into the inputs for the neural net
- Writing the learning algorithm for the neural net to be as accurate as possible

## Implementation Details

### Weight Categories

- Numbers
- Pronouns
- Names
- Quotation marks
- Adverbs
- Adjectives
- Commas

### Expecting More to Appear In

**Expository**

- Numbers
- Commas

**Narrative**

- Pronouns
- Names
- Quotation marks
- Adverbs
- Adjectives

### Value Calculations

Values will be computed by the number of occurances of the category in the excerpt divided by the total number of words in the excerpt.

## Timeline

- Neural Net Algorithm Design (2 days)
- Neural Net Programming (2 days)
- Compiling Training Data (2 days)
- Rails backend (1 day)
- Javascript frontend (1 day)

## Future Directions

- [ ] Add in the other two categories, Descriptive and Argumentative
