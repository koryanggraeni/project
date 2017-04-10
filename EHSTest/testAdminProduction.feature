Feature: testAdminProduction

@mytag
Scenario: verify login as admin user
	Given I am on admin page "http://ehs.website-test.t1.voxteneo.com/sign-in"
	And I input the email and password
	| email            | password      |
	| EHSAdministrator | pass@word2016 |
	When I press Sign In button in admin page 
	Then I should on User List page 

