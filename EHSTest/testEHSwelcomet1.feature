Feature: testEHSwelcomet1
@mytag
Scenario: check scroll in landing page 
	Given I am on landing page "http://ehs.welcome.t1.voxteneo.com/"
	When the page is loaded
	Then scroll should not appear
