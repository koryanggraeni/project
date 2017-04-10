Feature: auth
	In order to access the pops chord website 
	As a user admin
	I want to be logged to the website

@mytag
Scenario: login failed username not exist
	Given I open the pops chord website
	And I should see "Popscord" as title
	And I have entered "qwertyuiop" as username
	And I have entered "Vox2017" as password
	When I press login
	Then I should see "Invalid email address" as error message 

Scenario: login failed wrong password
	Given I open the pops chord website
	And I should see "Popscord" as title
	And I have entered "admin" as username
	And I have entered "qwertyui" as password
	When I press login
	Then I should see "Login failed!" as error message 
	And I should see "Invalid user name or password" as password error message 

Scenario: login
	Given I open the pops chord website
	And I should see "Popscord" as title
	And I have entered "admin" as username
	And I have entered "Vox2017" as password
	When I press login
	Then I should see "Popscord" as title

Scenario: 107621 Allow duplicate Link's Title (add)
	Given I go to score list page 
	And I press "CreateNewScoreButton" button 
	And I input all required fields on score
	| title                | reference    | categories        |
	| korytest030420171150 | 030420171150 | Test Thierry test |
	And I press next button until the link tab opened 
	And I press "CreateNewLinkButton" button
	And I input link data with 
	| title | url          | order |
	| test  | www.test.com | 1     |
	When I press the link save button 
	Then I should see success message if "Saved successfully."
