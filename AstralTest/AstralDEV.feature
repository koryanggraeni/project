Feature: AstralDEV

@mytag
Scenario: #92055 check create new vehicle type (dev)
	Given I loggin to the website as admin (dev) 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Vehicle Edit page (dev)
	And I click "Plate" tab (dev)
	And I click create new button on plate tab (dev)
	When I input plate data (dev)
	| plateNumber | startDate  | endDate    |
	| SASA        | 18/11/2016 | 20/11/2016 |
	And I click save button "savePlateNumber" (dev)
	Then I should able to see message "Vehicle plate number successfully created." (dev)

Scenario: #91473 check document/email template data on page 2 (dev)
	Given I loggin to the website as admin (dev) 
	| username | password |
	| Admin    | _Admin1! |
	And I go to document/email template page (dev) 
	When I go to page "2" (dev) 
	Then I should see "2" data (dev) 
