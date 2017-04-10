Feature: check VdFin Vocher 

@mytag
Scenario: Go to brand form page and download pdf
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press print button 
	Then PDF should be downloaded 

Scenario: #81429 check FR text in homepage
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/"
	When The home page is loaded
	Then I should see the text in homepage
	| line | text                    |
	| li   | Bienvenue               |
	| span | Choisissez votre langue |

Scenario: #81429 check FR text in landing page
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	When The landing page is loaded
	Then I should see the text in landing page 
	| line                | text                                                                                                                                                                                                                                                                                                                                                                                                     |
	| h1                  | Le moment est venu d’envisager quelque chose de nouveau                                                                                                                                                                                                                                                                                                                                                  |
	| p                   | Vous avez certainement vécu des moments très agréables ces dernières années au volant de votre voiture. Mais le temps file et votre contrat de financement arrive bientôt à échéance. Savez-vous déjà quel sera votre prochain coup de cœur ?                                                                                                                                                            |
	| //p[2]              | Votre distributeur a d’excellentes nouvelles pour vous\r\n Comme mentionné dans la lettre que vous avez reçue dernièrement, nous tenons à récompenser votre fidélité. Entrez votre identifiant ci-dessous, téléchargez votre voucher de fidélité et remettez-le à votre distributeur. Il vous fera une offre sur mesure à un tarif « fidélité » très avantageux. Vous allez être agréablement surpris(e) ! |
	| //p[3]              | Profitez-en sans attendre. Identifiez-vous !                                                                                                                                                                                                                                                                                                                                                             |
	| label               | Votre identifiant :?                                                                                                                                                                                                                                                                                                                                                                                     |
	| input.submit-button | POURSUIVRE                                                                                                                                                                                                                                                                                                                                                                                               |
	And I click help button
	And I should see the text in help pop-up
	| line                    | text                                                                                                                                                                                                                                                       |
	| h2                      | Où trouver mon identifiant ?                                                                                                                                                                                                                               |
	| div.content-wrapper > p | Votre identifiant personnel est repris dans le courrier envoyé par la poste à votre domicile. Vous ne le retrouvez plus ? Pas de soucis ! Votre identifiant correspond au numéro de votre contrat de financement actuel chez Volkswagen D’Ieteren Finance. |
	
Scenario: #81429 check NL text in homepage
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/"
	When The home page is loaded
	Then I should see the text in homepage
	| line      | text         |
	| //li[2]   | Welkom       |
	| //span[2] | Kies uw taal |

Scenario: #81429 check NL text in landing page
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	When The landing page is loaded
	Then I should see the text in landing page 
	| line                | text                                                                                                                                                                                                                                                                                                                                             |
	| h1                  | Dit is het perfecte moment om naar iets nieuws uit te kijken                                                                                                                                                                                                                                                                                     |
	| p                   | De voorbije jaren heeft u ongetwijfeld veel rijplezier beleefd aan uw wagen. Uw financieringscontract loopt echter binnenkort af. Inderdaad, de tijd gaat snel. Heeft u al nagedacht over uw toekomstige keuze?                                                                                                                                  |
	| //p[2]              | Uw verdeler heeft goed nieuws voor u\r\n Zoals vermeld in de brief die u reeds heeft ontvangen, belonen wij uw trouw! Voer uw login hieronder in, download uw getrouwheidsvoucher en ga ermee naar uw verdeler. Uw verdeler zal u een offerte op maat maken aan een interessant getrouwheidstarief. U mag een onweerstaanbaar aanbod verwachten! |
	| //p[3]              | Log meteen in en profiteer ervan!                                                                                                                                                                                                                                                                                                                |
	| label               | Uw login:?                                                                                                                                                                                                                                                                                                                                       |
	| input.submit-button | VERDER                                                                                                                                                                                                                                                                                                                                           |
	And I click help button
	And I should see the text in help pop-up
	| line                    | text                                                                                                                                                                                                                            |
	| h2                      | Waar vind ik mijn login?                                                                                                                                                                                                        |
	| div.content-wrapper > p | Uw persoonlijke login staat vermeld in de brief die u via de post heeft ontvangen. Bent u deze brief kwijt? Geen probleem. Uw login is het contractnummer van uw huidig financieringscontract bij Volkswagen D’Ieteren Finance. |

Scenario: #82358 check blue box in FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	When The landing page is loaded
	Then I shouldn't see the blue box "FR"

Scenario: #82358 check blue box in NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	When The landing page is loaded
	Then I shouldn't see the blue box "NL"

Scenario: #82365 check bullet with i FR 
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When The home page is loaded
	Then I shouldn't see the bullet "FR"

Scenario: #82365 check bullet with i NL 
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When The home page is loaded
	Then I shouldn't see the bullet "NL"

Scenario: #82382 check email field FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button 
	Then I should see the email field is filled

Scenario: #82382 check email field NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button 
	Then I should see the email field is filled

Scenario: #82385 check "next" translation FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I should see "Suivant" in next button 
	
Scenario: #82385 check "next" translation NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I should see "Volgende" in next button 

Scenario: #82386 check email label FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I shouldn't see email text twice

Scenario: #82386 check email label NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I shouldn't see email text twice

Scenario: #82401 check "next" translation NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I the text in box should has been changed

Scenario: #82386 check address translations FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I should see address has changed "FR"

Scenario: #82386 check address translations NL
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/nl/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I should see address has changed "NL"

Scenario: #82409 check label translations in box FR
	Given I navigate to the page "http://vdf-voucher.t1.voxteneo.com/fr/Home/CheckContractNumber"
	And I input contract number field with "123-1234562-AU" 
	And I press submit button 
	When I press email button
	Then I should see the label translation has been changed 