Feature: tryTinymce

@mytag 
@javascript
Scenario: verify success add news by admin
	Given I am on manage news admin page "http://ehs.t1.voxteneo.com/#/admin/news/create"
	And the Add News page is loaded
	When I upload the image 
	And I input the add news form 
	| imageTitle       | newsTitle       | shortDescription       | newsContent       |
	| test image title | test news title | test short description | test news content |
	And I click publish button
	Then I should see a success alert 
