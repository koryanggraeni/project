Feature: Ordering answers

@mytag
Scenario: the answer with highest vote get to the top
	Given there is a question "What's your favorite colour?" with the answers
	| Answer         | Vote |
	| red            | 1    |
	| Cucumber green | 1    |
	When you upvote answer "Cucumber green"
	Then the answer "Cucumber green" should be on top
