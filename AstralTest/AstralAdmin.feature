Feature: AstralAdmin

@mytag
Scenario: #82642 check create new vehicle type
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	When I input the Vehicle type name "Van"
	And I press "Create" button 
	Then I should see the alert success message "Vehicle Type successfully added."

Scenario: #82642 check create new vehicle type(that already exist)
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	When I input the Vehicle type name "Van"
	And I press "Create" button 
	Then I should see the alert error message "Same entry has been found. Please use another Name-en"

Scenario: #82642 check create new vehicle type(is empty)
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	When I input the Vehicle type name ""
	And I press "Create" button 
	Then I should see the error message "Name"

Scenario: #92319 Going to Edit Driver
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Costumer Edit page 
	When I click "Drivers" tab

Scenario: #92319 Successfully Edit Driver
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Costumer Edit page 
	And I click "Drivers" tab
	And I click edit icon on driver tab 
	When I input driver name 
	When I click save button "modalDriverSave"
	Then I should able to see message "Driver is successfully updated."

Scenario: #92319 Failed to Edit Driver with blank field
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Costumer Edit page 
	And I click "Drivers" tab
	And I click edit icon on driver tab 
	And I delete all data 
	When I click save button "modalDriverSave"
	Then I should able to see the error message

Scenario: #92319 Failed to Edit Driver with age under 18 years old
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Costumer Edit page 
	And I click "Drivers" tab
	And I click edit icon on driver tab 
	And I input the birth date 
	When I click save button "modalDriverSave"
	Then I should able to see the error message on brithdate 

Scenario: #92319 Cancel to Edit Driver
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Costumer Edit page 
	And I click "Drivers" tab
	And I click edit icon on driver tab 
	When I click close button on edit driver pop-up

Scenario: #91755 filter by contact person surename 
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Customer list page 
	And I open filter form 
	When I input name with "Basiah"
	And I press search button 
	Then I should see the customer with surename "Basiah"

Scenario: #92055 check create new vehicle type 
	Given I loggin to the website as admin 
	| username | password |
	| Admin    | _Admin1! |
	And I go to Vehicle Edit page 
	And I click "Plate" tab 
	And I click create new button on plate tab 
	When I input plate data 
	| plateNumber | startDate  | endDate    |
	| Y6GT        | 18/11/2016 | 20/11/2016 |
	And I click save button "savePlateNumber"
	Then I should able to see message "Vehicle plate number successfully created." 

Scenario: #91473 check document/email template data on page 2
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	And I go to document/email template page  
	When I go to page "2"  
	Then I should see "2" data 

Scenario: #89386 check delete translation 
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	And I go to document/email template edit page 
	When I click delete icon 
	And I click save button on document/email template page 
	Then I should able to see message "Template has been saved" 

Scenario: #97399 check Weird label in planning page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When I press "Planning" menu on side bar menu
	And I change language to "FR"
	Then I should see correct translation
	| xpath                  | translation     |
	| //div[2]/div/button    | Réduire tout    |
	| //div[2]/div/button[2] | Développer tout |
	| //div[2]/button        | journée         |

Scenario: #96945 check label translation on customer group page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I go to customer group page 
	Then I should see correct translation
	| xpath            | translation       |
	| //h1             | GROUPE DE CLIENTS |
	| //th/div/span    | Nom               |
	| //th[2]/div/span | Action fr         |

Scenario: #96945 check label translation on create customer group page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I go to customer group page 
	And I press "Add New fr" menu on side bar menu
	Then I should see correct translation
	| xpath   | translation       |
	| //h1    | GROUPE DE CLIENTS |
	| //label | Nom *             |

Scenario: #96945 check label translation on blocking setting page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I press "Client" menu on side bar menu
	And I press "Paramètres de blocage" menu on side bar menu
	And I press "Créer un nouveau" menu on side bar menu
	Then I should see correct translation
	| xpath   | translation |
	| //th[3] | Action fr   |

Scenario: #96945 check label translation on customer page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I go to customer page 
	Then I should see correct translation
	| xpath              | translation        |
	| //th/div/span      | Nom                |
	| //th[2]/div/span   | Type de client     |
	| //th[3]/div/span   | Groupe de clients  |
	| //th[4]/div/span   | Adresse            |
	| //th[5]/div/span   | Téléphone          |
	| //th[6]/div/span   | GSM                |
	| //th[7]/div/span   | Email              |
	| //th[8]/div/span   | Action fr          |
	| //form/button      | Exportation        |
	| //div[2]/div/div/a | Ajouter un nouveau |

Scenario: #96945 check label translation on filter customer page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I go to customer page 
	And I press filter icon 
	Then I should see correct translation
	| xpath                      | translation               |
	| //option                   | Tous les types de clients |
	| //div[3]/div/select/option | Tous les groupes clients  |
	| //div[2]/div[3]/label      | Email                     |

Scenario: #96945 check label translation on vehicle page
	Given I loggin to the website as admin  
	| username | password |
	| Admin    | _Admin1! |
	When  I change language to "FR"
	And I go to vehicle page 
	Then I should see correct translation
	| xpath             | translation           |
	| //div[2]/div/a    | FILTER YOUR RESULT FR |
	| //th[10]/div/span | Action fr             |