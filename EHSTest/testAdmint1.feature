Feature: test Admin t1

@mytag
Scenario: verify add news form by admin 
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	And the Manage News page is loaded 
	When I click "Add new" button 
	Then the Add News page is loaded

Scenario: verify success add news by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I upload the image 
	And I input the add news form 
	| imageTitle       | newsTitle       | shortDescription       | newsContent       |
	| test image title | test news title | test short description | test news content |
	And I click publish button
	Then I should see pop-up notification "Add news successfully!"

Scenario: verify failed add news by admin(the required field is empty)
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I click publish button
	Then I should see a error message "news" 

Scenario: verify success save to draft news by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I upload the image 
	And I input the add news form 
	| imageTitle       | newsTitle       | shortDescription       | newsContent       |
	| test image title | test news title | test short description | test news content |
	And I click save to draft button
	Then I should see pop-up notification "Add news successfully!"

Scenario: Verify manage news page 
	Given I login to ehs website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to manage news page 
	When the manage news page is loaded 
	Then I check Add new button
	And I check search function 
	And I check filtering by language
	And I check filtering by show entries "10"
	And I check filtering by show entries "5"
	And I check sorting the data table
	And I check view on public site
	And I check Edit News "1" 
	And I check Delete News "1"
	And I check see all translation

Scenario: verify success edit news by admin
	Given I login to ehs website
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	And the Manage News page is loaded
	When I click edit icon 
	And I input the edit news form 
	| imageTitle              | newsTitle              | shortDescription              |
	| test image title change | test news title change | test short description change |
	And I click publish button
	Then I should see pop-up notification "News saved successfully!"

Scenario: #74673 verify success add page by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page/create"
	And the Add Pages page is loaded
	When I upload the image 
	And I input the add page form 
	| metaDescription  | metaKeyWords  | title      | url        | content      |
	| test description | testKeyswords | test title | test-title | test content |
	And I click publish button
	Then I should see pop-up notification "Add page successfully!"

Scenario: #74673 verify failed add page by admin(the required field is empty)
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page/create"
	And the Add Pages page is loaded
	When I click publish button
	Then I should see a error message "page" 

Scenario: #74673 verify success save to draft page by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page/create"
	And the Add Pages page is loaded
	When I upload the image 
	And I input the add page form 
	| metaDescription   | metaKeyWords   | title       | url         | content       |
	| test description1 | testKeyswords1 | test title1 | test-title1 | test content1 |
	And I click save to draft button
	Then I should see pop-up notification "Add page successfully!"

Scenario: #73488 check view news of public when status is draft 
	Given I login to ehs website
	| username    | password    |
	| lucubanget | lucubanget |
	When I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	Then the Manage News page is loaded

Scenario: #79019 check draft status
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I upload the image 
	And I input the add news form 
	| imageTitle       | newsTitle       | shortDescription | newsContent     |
	| test image draft | test news draft12 | test short draft | test news draft |
	And I click save to draft button
	Then I input "test news draft12" to  search field
	And I should see draft status on draft news

Scenario: #79019 check search by date
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	And the Manage News page is loaded
	When I search data "02/08/2016"
	Then the search by date should be works

Scenario: #79019 check latest update news
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I upload the image 
	And I input the add news form 
	| imageTitle                   | newsTitle              | shortDescription                   | newsContent              |
	| test image title latest news | test latest news title | test short description latest news | test latest news content |
	And I click publish button
	And I go to home page 
	Then I should see "test latest news title" as title in latest news

Scenario: #74677 verify success edit page by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	And the Manage Pages page is loaded
	When I click edit icon 
	And the edit page should be loaded
	And I input the edit pages form 
	| title        | content        |
	| change title | change content |
	And I upload the image
	And I click publish button
	Then I should see pop-up notification "Page updated successfully!"

Scenario: #74676 verify success delete page by admin
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	And the Manage Pages page is loaded
	When I click delete icon 
	And the delete pop-up should be appear
	And I click yes button
	Then I should see pop-up notification "test title and related translations are deleted"

Scenario: #80805 check latest news
	Given I login to ehs website  
	| username    | password    |
	| lucubanget | lucubanget |
	When I create news
	| imageTitle | newsTitle  | shortDescription | newsContent |
	| test first | test first | test first       | test first  |
	And I create news
	| imageTitle  | newsTitle   | shortDescription | newsContent |
	| test latest | test latest | test latest      | test latest |
	And I go to home page 
	Then I should see "test latest" as title in latest news

Scenario: #74672 check view page list
	Given I login to ehs website  
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	When the Manage Pages page is loaded
	Then I should see pagination
	And I should able to sort the list 
	And I shouldn't delete the default page

Scenario: #74672 check view list of pages(not logged)
	Given I open the driver
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	Then I should see sign-in page 

Scenario: #73492 check view list of country
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage country page "http://ehs.website-test.t1.voxteneo.com/#/admin/country"
	When the Manage Country page is loaded
	Then I should see pagination
	And I filter by show entries
	And I sort by country name 
	And I should able to edit country

Scenario: #73492 check view list of country(not logged)
	Given I open the driver
	And I am on manage country page "http://ehs.website-test.t1.voxteneo.com/#/admin/country"
	Then I should see sign-in page 

Scenario: #74674 check view page on public
	Given I login to ehs website  
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	When I click view on public icon 
	Then the page should redirect to page on public

Scenario: #73489 check view news details
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click news title "test news draft12"
	Then the news detail content should read only
	And the page should redirect to edit page when edit button clicked
	And the page should show delete pop-up when delete button clicked

Scenario: #80776 check delete icon in manage news page
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click delete icon
	Then I should see delete news verification pop-up

Scenario: #80926 check search field in manage news
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I search data "test"
	And I press enter 
	Then I should on manage news page 

Scenario: #81182 check create news localiztion 
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click "Add new" button
	Then I should see the localization is "http://ehs.website-test.t1.voxteneo.com/#/admin/news/create?lg=en"

Scenario: #81182 check edit news localiztion 
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click edit icon
	Then I should see the localization is "http://ehs.website-test.t1.voxteneo.com/#/admin/news/7/edit?lg=en"

Scenario: #81182 check view news localiztion 
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click news title "test news draft12"
	Then I should see the localization is "http://ehs.website-test.t1.voxteneo.com/#/admin/news/7/view?lg=en"

Scenario: #81182 check add news translation localiztion 
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click "see all translations" link in admin page
	And I click add icon traslation
	Then I should see the localization is "http://ehs.website-test.t1.voxteneo.com/#/admin/news/7/translate?source=en&target=fr"

Scenario: #81240 check upload picture in manage country
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage country page "http://ehs.website-test.t1.voxteneo.com/#/admin/country"
	When I click edit icon in manage country
	And I upload the image
	Then the image should be uploaded 

Scenario: #74675 check manage public content 
	Given I login to ehs website
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I am on manage page admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/page"
	When I click news title "Help"
	Then I should see view detiail page 
	And all field should be read-only 
	And edit and delete button should able to click 

Scenario: #81493 check field in view news detail page
	Given I login to ehs website
	| username  | password |
	| anggraeni | password |
	And I am on manage news admin page "http://ehs.website-test.t1.voxteneo.com/#/admin/news"
	When I click news title "test latest"
	Then the news detail content should read only
	And the page should redirect to edit page when edit button clicked
	And the page should show delete pop-up when delete button clicked

