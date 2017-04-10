Feature: testProduction

@mytag
Scenario: verify sign up in landing page on production 
	Given I go to the landing page "http://educatorshomeshare.com/"
	And I input the following page 
	| FirstName | LastName  | CountryOfResidence | Email               |
	| Kory      | Anggraeni | Indonesia          | kory123443@mailinator.com |
	And I press i'm not robot
	When I press sign up button 
	Then I should on welcome page 
