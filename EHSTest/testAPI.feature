Feature: testAPI

@mytag
Scenario: check API login 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Login" 
	And I see the text "POST api/Account/Login" in the page  
	When I press test API button
	And I input the username and password 
	| username    | password    |
	| utaricantik | utaricantik |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Account/Login"
	And Status should be OK
	And get the token

Scenario: check API view profile
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId"
	And I see the text "GET api/Users/{UserId}" in the page 
	When I add header with token
	|username|password|
	|anggraeni|password|  
	And I input the user Id "1138c45b-9d40-4a8f-aa01-fe17518d0c2d"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/{UserId}"
	And Status should be OK

Scenario: check Edit User API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Edit"
	And I see the text "POST api/Users/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data 
	| email                      | addressOne     | city      | addreseTwo     | houseNo | province      | postalCode | latitude | logitude | countryId | userId                               | userName    | firstName | lastName | homeNumber | mobileNumber | profileDescription | imageId |
	| utaricantik@mailinator.com | test address 1 | test city | test address 2 | 3       | test province | 12345      | 1.0      | 1.0      | 1         | 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | utaricantik | utari     | cantik   | 0987654321 | 0987654321   | test desccription  |         | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Edit"
	And Status should be OK

Scenario: check Edit User API (invalid image Id)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Edit"
	And I see the text "POST api/Users/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data 
	| email                      | addressOne     | city      | addreseTwo     | houseNo | province      | postalCode | latitude | logitude | countryId | userId                               | userName    | firstName | lastName | homeNumber | mobileNumber | profileDescription | imageId |
	| utaricantik@mailinator.com | test address 1 | test city | test address 2 | 3       | test province | 12345      | 1.0      | 1.0      | 1         | 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | utaricantik | utari     | cantik   | 0987654321 | 0987654321   | test desccription  |    1234     | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Edit"
	And Status should be Bad Request

Scenario: check Edit User API (required field is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Edit"
	And I see the text "POST api/Users/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data 
	| email | addressOne     | city      | addreseTwo     | houseNo | province      | postalCode | latitude | logitude | countryId | userId                               | userName    | firstName | lastName | homeNumber | mobileNumber | profileDescription | imageId |
	|       | test address 1 | test city | test address 2 | 3       | test province | 12345      | 1.0      | 1.0      | 1         | 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | utaricantik | utari     | cantik   | 0987654321 | 0987654321   | test desccription  | 1234    | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Edit"
	And Status should be Bad Request

Scenario: check Edit Country API (required field is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Country-Edit"
	And I see the text "POST api/Country/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the country data 
	| countryId | name | imageId |
	| a         | test | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Country/Edit"
	And Status should be Bad Request

Scenario: check review summary API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user id data 
	| userId                               |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be OK

Scenario: #80333 check save news API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Save"
	And I see the text "POST api/News/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	| 0      | true        | 00111FA6-AE83-4ACD-876B-08CF49930CD0 | test     | test     | 0                 | title | description      | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Save"
	And Status should be OK

Scenario: check save news API (data is not valid)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Save"
	And I see the text "POST api/News/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	| 1      | true        | 3495d798-2793-4fa8-a3b7-71777f3ffa0b | test     | test     | 5                 | title | description      | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Save"
	And Status should be Bad Request

Scenario: check save news API (required field is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Save"
	And I see the text "POST api/News/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	|        | true        | 3495d798-2793-4fa8-a3b7-71777f3ffa0b | test     | test     | 0                | title | description      | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Save"
	And Status should be Bad Request

Scenario: #80333 check edit news API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Edit"
	And I see the text "POST api/News/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	| 2      | true        | 00111FA6-AE83-4ACD-876B-08CF49930CD0 | test     | test     | 0                 | title | description      | test     |  2         |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Edit"
	And Status should be OK

Scenario: check edit news API (data is not valid)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Edit"
	And I see the text "POST api/News/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	| 1      | true        | 3495d798-2793-4fa8-a3b7-71777f3ffa0b | test     | test     | 5                 | title | description      | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Edit"
	And Status should be Bad Request

Scenario: check edit news API (required field is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-News-Edit"
	And I see the text "POST api/News/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the news data 
	| newsId | isPublished | coverImage                           | createBy | updateBy | newsTranslationId | title | shortDescription | contents | languageId |
	|        | true        | 3495d798-2793-4fa8-a3b7-71777f3ffa0b | test     | test     | 0                | title | description      | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/News/Edit"
	And Status should be Bad Request

Scenario: check get language API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Master-Languages"
	And I see the text "GET api/Master/Languages" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Master/Languages"
	And Status should be OK

Scenario: #80333 check news detail API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News-Detail-id"
	And I see the text "GET api/News/Detail/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news id "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News/Detail/{id}"
	And Status should be OK

Scenario: check news detail API(empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News-Detail-id"
	And I see the text "GET api/News/Detail/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news id "986545676"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News/Detail/{id}"
	And Status should be Bad Request

Scenario: check search news API(by title and create date)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News_Title_CreatedDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data news
	| title | createDate |
	| test  | 2016-06-09 |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check search news API(by title)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News_Title_CreatedDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data news
	| title | createDate |
	|       | 2016-06-09 |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check search news API(by create date)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News_Title_CreatedDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data news
	| title | createDate |
	| test  |            |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check delete news API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-News-DeleteNews-id"
	And I see the text "DELETE api/News/DeleteNews/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news id "1001"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/News/DeleteNews/{id}"
	And Status should be OK

Scenario: check delete news API(invalid news id)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-News-DeleteNews-id"
	And I see the text "DELETE api/News/DeleteNews/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news id "99999"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/News/DeleteNews/{id}"
	And Status should be Bad Request

Scenario: check delete news translation API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-News-DeleteNewsTranslation-id"
	And I see the text "DELETE api/News/DeleteNewsTranslation/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news translation id "1000"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/News/DeleteNewsTranslation/{id}"
	And Status should be OK

Scenario: check delete news translation API(invalid translation id)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-News-DeleteNewsTranslation-id"
	And I see the text "DELETE api/News/DeleteNewsTranslation/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input news translation id "99999"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/News/DeleteNewsTranslation/{id}"
	And Status should be Bad Request

Scenario: check recommendation API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Recommendation-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id in recommendation "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check recommendation API (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Recommendation-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button 
	And I input user Id in recommendation "1138c45b-9d40-4a8f-aa01-fe17518d0c2d"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: check recommendation API (bad request)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Recommendation-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id and bad request in recommendation "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Recommendation/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: check review from me API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id in review from me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check review from me API (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button 
	And I input user Id in review from me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: check review from me API (bad request)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id and bad request in review from me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: check review for me API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id in review for me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check review for me API (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button 
	And I input user Id in review for me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: check review for me API (bad request)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input user Id and bad request in review for me "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario:#75040 check delete images API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-Delete-imageId"
	And I see the text "POST api/Media/Images/Delete/{imageId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id "631304BE-FCCD-4AA3-A14F-01DA51B561CB" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/Delete/{imageId}"
	And Status should be OK

Scenario:#75040 check delete images API failed(incorrect image)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-Delete-imageId"
	And I see the text "POST api/Media/Images/Delete/{imageId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id "9999999999999999999999999" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/Delete/{imageId}"
	And Status should be Not Found

Scenario:#75040 check delete images API failed(not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-Delete-imageId"
	And I see the text "POST api/Media/Images/Delete/{imageId}" in the page
	When I press test API button 
	And I input image id "631304BE-FCCD-4AA3-A14F-01DA51B561CB"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/Delete/{imageId}"
	And Status should be Unauthorized

Scenario: check get news API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News_Title_CreatedDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input get news link
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News?Title={Title}&CreatedDate={CreatedDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: check view public profile API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId"
	And I see the text "GET api/Users/{UserId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/{UserId}"
	And Status should be OK

Scenario: check view listing detail API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
    When I input the user Id 
	|username|password|
	|anggraeni|password|
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be OK

Scenario: #80333 check edit generic page API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Generic-Save"
	And I see the text "POST api/StaticPages/Generic/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data  
	| id | type | active | slug | coverImageId | createBy | updateBy | genericContentTranslationId | title | contents | languageId |
	| 4  | test | true   | test | 019DDB17-BCE1-4C07-A93F-068684DFDEB4 | test     | test     | 4                           | test FR | test FR  | 2          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Generic/Save"
	And Status should be OK

Scenario: check delete generic translation API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-StaticPages-DeleteGenericTranslation-id"
	And I see the text "DELETE api/StaticPages/DeleteGenericTranslation/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input generic translation id "9"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/StaticPages/DeleteGenericTranslation/{id}"
	And Status should be OK

Scenario: check delete generic translation API (failed undifined translation)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-StaticPages-DeleteGenericTranslation-id"
	And I see the text "DELETE api/StaticPages/DeleteGenericTranslation/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input generic translation id "99"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/StaticPages/DeleteGenericTranslation/{id}"
	And Status should be Bad Request

Scenario: check delete generic API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-StaticPages-DeleteGeneric-id"
	And I see the text "DELETE api/StaticPages/DeleteGeneric/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input generic id "5"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/StaticPages/DeleteGeneric/{id}"
	And Status should be OK

Scenario: check delete generic API (failed undifined generic)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-StaticPages-DeleteGeneric-id"
	And I see the text "DELETE api/StaticPages/DeleteGeneric/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input generic id "55"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/StaticPages/DeleteGeneric/{id}"
	And Status should be Bad Request

Scenario: check delete generic API (failed reject)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-StaticPages-DeleteGeneric-id"
	And I see the text "DELETE api/StaticPages/DeleteGeneric/{id}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input generic id "1"
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/StaticPages/DeleteGeneric/{id}"
	And Status should be Bad Request

Scenario: check latitue and longitude in Edit User API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Edit"
	And I see the text "POST api/Users/Edit" in the page
	When I press test API button 
	And I input the user data 
	| email                      | addressOne     | city      | addreseTwo     | houseNo | province      | postalCode | latitude | logitude | countryId | userId                               | userName    | firstName | lastName | homeNumber | mobileNumber | profileDescription | imageId |
	| utaricantik@mailinator.com | test address 1 | test city | test address 2 | 3       | test province | 12345      | 1.0      | 1.0      | 1         | 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | utaricantik | utari     | cantik   | 0987654321 | 0987654321   | test desccription  |         | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Edit"
	And Status should be OK
	And I check view the user data
	| username  | password |
	| anggraeni | password | 

Scenario: #80333 check view general page detail API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-Generic-Detail-id"
	And I see the text "GET api/StaticPages/Generic/Detail/{id}" in the page
	When I press test API button 
	And I input generic id "4"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/Generic/Detail/{id}"
	And Status should be OK

Scenario: check save about Us API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I press test API button 
	And I input the generic data page data 
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test nl | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be OK

Scenario: check save about Us API (data is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 0  | true   | about-us | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: check save about Us API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: check save about Us API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test fr | test123  | 4          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: check save about Us API (inactive)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | false  | about-us | test     | test     | 0                           | test fr | test123  | 2          |       
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

	Scenario: check save term Of Service API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-TermOfService-Save"
	And I see the text "POST api/StaticPages/TermOfService/Save" in the page
	When I press test API button 
	And I input the generic data page data 
	| id | active | slug             | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 2  | true   | terms-of-service | test     | test     | 0                           | test nl | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/TermOfService/Save"
	And Status should be OK

Scenario: check save term Of Service API (data is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-TermOfService-Save"
	And I see the text "POST api/StaticPages/TermOfService/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug             | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 0  | true   | terms-of-service | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/TermOfService/Save"
	And Status should be Bad Request

Scenario: check save term Of Service API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-TermOfService-Save"
	And I see the text "POST api/StaticPages/TermOfService/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug             | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 2  | true   | terms-of-service | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/TermOfService/Save"
	And Status should be Bad Request

Scenario: check save term Of Service API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-TermOfService-Save"
	And I see the text "POST api/StaticPages/TermOfService/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug             | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 2  | true   | terms-of-service | test     | test     | 0                           | test fr | test123  | 4          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/TermOfService/Save"
	And Status should be Bad Request

Scenario: check save term Of Service API (inactive)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-TermOfService-Save"
	And I see the text "POST api/StaticPages/TermOfService/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug             | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 2  | false  | terms-of-service | test     | test     | 0                           | test fr | test123  | 2          |       
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/TermOfService/Save"
	And Status should be Bad Request

	Scenario: check save How It Works API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-HowItWorks-Save"
	And I see the text "POST api/StaticPages/HowItWorks/Save" in the page
	When I press test API button 
	And I input the generic data page data 
	| id | active | slug         | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 3  | true   | how-it-works | test     | test     | 0                           | test nl | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/HowItWorks/Save"
	And Status should be OK

Scenario: check save How It Works API (data is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-HowItWorks-Save"
	And I see the text "POST api/StaticPages/HowItWorks/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug         | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 0  | true   | how-it-works | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/HowItWorks/Save"
	And Status should be Bad Request

Scenario: check save How It Works API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-HowItWorks-Save"
	And I see the text "POST api/StaticPages/HowItWorks/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug         | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 3  | true   | how-it-works | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/HowItWorks/Save"
	And Status should be Bad Request

Scenario: check save How It Works API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-HowItWorks-Save"
	And I see the text "POST api/StaticPages/HowItWorks/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug         | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 3  | true   | how-it-works | test     | test     | 0                           | test fr | test123  | 4          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/HowItWorks/Save"
	And Status should be Bad Request

Scenario: check save How It Works API (inactive)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-HowItWorks-Save"
	And I see the text "POST api/StaticPages/HowItWorks/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug         | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 3  | false  | how-it-works | test     | test     | 0                           | test fr | test123  | 2          |       
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/HowItWorks/Save"
	And Status should be Bad Request

	Scenario: check save Help API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Help-Save"
	And I see the text "POST api/StaticPages/Help/Save" in the page
	When I press test API button 
	And I input the generic data page data 
	| id | active | slug | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 4  | true   | help | test     | test     | 0                           | test nl | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Help/Save"
	And Status should be OK

Scenario: check save Help API (data is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Help-Save"
	And I see the text "POST api/StaticPages/Help/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug | createBy | updateBy | genericContentTranslationId | title  | contents | languageId |
	| 0  | true   | help | test     | test     | 0                           | test f | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Help/Save"
	And Status should be Bad Request

Scenario: check save Help API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Help-Save"
	And I see the text "POST api/StaticPages/Help/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug | createBy | updateBy | genericContentTranslationId | title  | contents | languageId |
	| 4  | true   | help | test     | test     | 0                           | test f | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Help/Save"
	And Status should be Bad Request

Scenario: check save Help API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Help-Save"
	And I see the text "POST api/StaticPages/Help/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug | createBy | updateBy | genericContentTranslationId | title  | contents | languageId |
	| 4  | true   | help | test     | test     | 0                           | test f | test123  | 4          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Help/Save"
	And Status should be Bad Request

Scenario: check save Help API (inactive)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Help-Save"
	And I see the text "POST api/StaticPages/Help/Save" in the page
	When I press test API button 
	And I input the generic data page data
	| id | active | slug | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 4  | false  | help | test     | test     | 0                           | test fr | test123  | 2          |       
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Help/Save"
	And Status should be Bad Request

Scenario: #80333 check save generic page API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Generic-Save"
	And I see the text "POST api/StaticPages/Generic/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data 
	| id | active | slug      | createBy | updateBy | genericContentTranslationId | title | contents | languageId |
	| 0  | true   | test-1234 | test     | test     | 0                           | test  | test     | 2          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Generic/Save"
	And Status should be OK

Scenario: check save generic page API (data is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Generic-Save"
	And I see the text "POST api/StaticPages/Generic/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data 
	| id  | active | slug | createBy | updateBy | genericContentTranslationId | title | contents | languageId |
	| 6   | true   | test | test     | test     | 0                           | test  | test     | 1          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Generic/Save"
	And Status should be Bad Request

Scenario: check save generic page API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Generic-Save"
	And I see the text "POST api/StaticPages/Generic/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data 
	| id  | active | slug | createBy | updateBy | genericContentTranslationId | title | contents | languageId |
	| 6   | true   | test | test     | test     | 0                           | test  | test     | 2          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Generic/Save"
	And Status should be Bad Request

Scenario: check save generic page API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-Generic-Save"
	And I see the text "POST api/StaticPages/Generic/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data 
	| id  | active | slug | createBy | updateBy | genericContentTranslationId | title | contents | languageId |
	| 6   | true   | test | test     | test     | 0                           | test  | test     | 4          |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/Generic/Save"
	And Status should be Bad Request

Scenario: #75169 check empty mandatory variable
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Media-Images-imageId_width_height"
	And I see the text "GET api/Media/Images/{imageId}?width={width}&height={height}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I click send button
	And I input the get image data
	| imageId | width | height |
	|         |       |        |
	Then The result pop-up should be opened "Response for GET api/Media/Images/{imageId}?width={width}&height={height}"
	And Status should be Bad Request

Scenario: #75169 check invalid data to input 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Media-Images-imageId_width_height"
	And I see the text "GET api/Media/Images/{imageId}?width={width}&height={height}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the get image data
	| imageId                              | width | height |
	| 019DDB17-BCE1-4C07-A93F-068684DFDEB4 |     | aaa    |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Media/Images/{imageId}?width={width}&height={height}"
	And Status should be Bad Request

Scenario: #77837 check Review Summary
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "1138c45b-9d40-4a8f-aa01-fe17518d0c2d" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be OK

Scenario: #73550 search listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Search"
	And I see the text "POST api/Listing/Search" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data listing
	| userName    | destination | dateFrom   | dateTo     | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	| utaricantik | Indonesia   | 2016-07-26 | 2016-07-26 | 1            | 1             | 1            | true                   |          | 0      | 10    | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Search"
	And Status should be OK

Scenario: #73550 search public 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-SearchPublic"
	And I see the text "POST api/Listing/SearchPublic" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data listing
	| userName    | destination | dateFrom   | dateTo     | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	| utaricantik | Indonesia   | 2016-07-26 | 2016-07-26 | 1            | 1             | 1            | true                   |          | 0      | 10    | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/SearchPublic"
	And Status should be OK

Scenario: #74357 delete listing photo 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId                              | listingId |
	| 2a54baad-077b-4c5c-af01-f684faca043b | 2         | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be OK

Scenario: #74357 delete listing photo (failed the image is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId      | listingId |
	| 000000000000 | 2         | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be Bad Request

Scenario: #74357 delete listing photo (failed the listing is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId                              | listingId |
	| 019ddb17-bce1-4c07-a93f-068684dfdeb4 | 000       | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be Bad Request

Scenario: #73611 check all sharing my home
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-Host-userId_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input user id and status 
	| userId                               | status |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | All    | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73611 check requested sharing my home
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-Host-userId_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input user id and status 
	| userId                               | status    |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | Requested | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73611 check accepted sharing my home
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-Host-userId_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input user id and status 
	| userId                               | status   |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | Accepted | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73611 check declined sharing my home
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-Host-userId_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input user id and status 
	| userId                               | status   |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | Declined | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/Host/{userId}?Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #75172 check save about us change madatory variable
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the about us wrong data page data 
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test nl | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: #79167 check save about Us API (translation is exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test fr | test123  | 2          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: #79167 check save about Us API (language is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-StaticPages-AboutUs-Save"
	And I see the text "POST api/StaticPages/AboutUs/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the generic data page data
	| id | active | slug     | createBy | updateBy | genericContentTranslationId | title   | contents | languageId |
	| 1  | true   | about-us | test     | test     | 0                           | test fr | test123  | 4          |         
	And I click send button
	Then The result pop-up should be opened "Response for POST api/StaticPages/AboutUs/Save"
	And Status should be Bad Request

Scenario: #73600 check verification email 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-Email-userId"
	And I see the text "GET api/Verification/Email/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the email verification data
	| userId                               | status |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | Email  | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/Email/{userId}"
	And Status should be OK

Scenario: #73600 check send verification email (failed user is not registered)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-Email-userId"
	And I see the text "GET api/Verification/Email/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the email verification data
	| userId                               | status |
	| oiuytre867rj7ij6jjjjlkjhgfdhgfkjhgfd | Email  | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/Email/{userId}"
	And Status should be Bad Request

Scenario: #73600 check send verification email (failed user is not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-Email-userId"
	And I see the text "GET api/Verification/Email/{userId}" in the page
	When I press test API button 
	And I input the email verification data
	| userId                               | status |
	| 1138c45b-9d40-4a8f-aa01-fe17518d0c2d | Email  |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/Email/{userId}"
	And Status should be Unauthorized

Scenario: #73603 check confrimation verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status"
	And I see the text "POST api/Verification/Confirmation/{token}?status={status}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the confrimation verification data
	| token                            | status |
	| 595851c7dd6f404ea2716bf989b155fe | Email  |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Confirmation/{token}?status={status}"
	And Status should be OK

Scenario: #76302 check change password API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-ChangePassword-userId"
	And I see the text "POST api/Account/ChangePassword/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I data for change password
	| userId                               | oldPassword | newPassword |
	| 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucu12345  | lucubanget   | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Account/ChangePassword/{userId}"
	And Status should be OK

Scenario: #80551 get generic content by slug 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-Generic-slug"
	And I see the text "GET api/StaticPages/Generic/{slug}" in the page
	When I press test API button 
	And I input the slug "help" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/Generic/{slug}"
	And Status should be OK

Scenario: #80551 get generic content by slug (the slug is not found)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-Generic-slug"
	And I see the text "GET api/StaticPages/Generic/{slug}" in the page
	When I press test API button 
	And I input the slug "thsgdhjyyegfffdfegwfytwyftwyffgudfgtw" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/Generic/{slug}"
	And Status should be Bad Request

Scenario: #73642 view list of testimonial (all)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-Manages_Approval_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the testimonial url "0" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73642 view list of testimonial (approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-Manages_Approval_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the testimonial url "1" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73642 view list of testimonial (not approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-Manages_Approval_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the testimonial url "2" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73642 view list of testimonial (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-Manages_Approval_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button 
	And I input the testimonial url "0"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/Manages?Approval={Approval}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #74339 check user verifications 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-User-UserId"
	And I see the text "GET api/Verification/User/{UserId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/User/{UserId}"
	And Status should be OK

Scenario: #74339 check user verifications (user not registered)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-User-UserId"
	And I see the text "GET api/Verification/User/{UserId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "qwertyuioplkjhgfdsacvbnmkjhgfert" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/User/{UserId}"
	And Status should be Bad Request

Scenario: #74339 check user verifications (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-User-UserId"
	And I see the text "GET api/Verification/User/{UserId}" in the page
	When I press test API button 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/User/{UserId}"
	And Status should be Unauthorized 

Scenario: #73596 check delete account failed (password is wrong)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I input the user to delete
	| username   | password | passwordverification |
	| korycantik | password | 1234567890           |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be Bad Request

Scenario: #73596 check delete account failed (username is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I input the user to delete
	| username | password | passwordverification |
	| 12345678 | password | password             |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be Unauthorized

Scenario: #73596 check delete account failed (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I press test API button 
	And I input the userdata to delete
	| userId                               | password |
	| 662f23dd-a770-45ec-9259-e0fda3a429ac | password |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be Unauthorized

Scenario: #73596 check delete account 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I input the user to delete
	| username   | password | passwordverification |
	| korycantik | password | password             |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be OK

Scenario: check save testimonial 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the testimonial data 
	| no | Id | UserId                               | UserName   | FirstName | LastName | ShortDescription | Description | ApprovedDate                      | CreatedDate                       |
	| 0  | 0  | 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucubanget | utari     | cantik   | test desc        | decs        | 2016-08-05T06:14:23.9108913 02:00 | 2016-08-05T06:14:23.9108913 02:00 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #74889 check view public content   
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-Generic-id"
	And I see the text "GET api/StaticPages/Generic/{id}" in the page
	When I press test API button 
	And I input the testimonial id "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/Generic/{id}"
	And Status should be OK

Scenario: #74889 check view public content(not found)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-Generic-id"
	And I see the text "GET api/StaticPages/Generic/{id}" in the page
	When I press test API button 
	And I input the testimonial id "9754"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/Generic/{id}"
	And Status should be Bad Request

Scenario: #73476 check user dashboard 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Dashboard-userId"
	And I see the text "GET api/Users/Dashboard/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Dashboard/{userId}"
	And Status should be OK

Scenario: #73476 check user dashboard (failed the user idd is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Dashboard-userId"
	And I see the text "GET api/Users/Dashboard/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "1234567890"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Dashboard/{userId}"
	And Status should be Bad Request

Scenario: #80240 check view public listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-View-userId"
	And I see the text "GET api/Listing/View/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/View/{userId}"
	And Status should be OK

Scenario: #80240 check view public listing (failed user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-View-userId"
	And I see the text "GET api/Listing/View/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "1234567890e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/View/{userId}"
	And Status should be Bad Request

Scenario: #80240 check view public listing (failed user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-View-userId"
	And I see the text "GET api/Listing/View/{userId}" in the page
	When I press test API button 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/View/{userId}"
	And Status should be Unauthorized

Scenario: #74886 check view page list 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-All_Title_Slug_PublishedDate_SearchValue_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/StaticPages/All?Title={Title}&Slug={Slug}&PublishedDate={PublishedDate}&SearchValue={SearchValue}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the page list url
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/All?Title={Title}&Slug={Slug}&PublishedDate={PublishedDate}&SearchValue={SearchValue}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #74980 check unshare listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-UnshareListing-listingId"
	And I see the text "POST api/Listing/UnshareListing/{listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the listing id "1" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/UnshareListing/{listingId}"
	And Status should be OK

Scenario: #74980 check unshare listing (listing id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-UnshareListing-listingId"
	And I see the text "POST api/Listing/UnshareListing/{listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the listing id "12345709876" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/UnshareListing/{listingId}"
	And Status should be Bad Request

Scenario: #74980 check unshare listing (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-UnshareListing-listingId"
	And I see the text "POST api/Listing/UnshareListing/{listingId}" in the page
	When I press test API button 
	And I input the listing id "1"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/UnshareListing/{listingId}"
	And Status should be Unauthorized

Scenario: #73650 check get all user (not input the data)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users_FirstName_LastName_Email_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users?FirstName={FirstName}&LastName={LastName}&Email={Email}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user for filter data
	| firstName | lastName | email | offset | limit | orderBy | orderDirection |
	|           |          |       |        |       |         |                | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users?FirstName={FirstName}&LastName={LastName}&Email={Email}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73650 check get user data (input the data)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users_FirstName_LastName_Email_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users?FirstName={FirstName}&LastName={LastName}&Email={Email}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user for filter data
	| firstName | lastName | email                     | offset | limit | orderBy | orderDirection |
	| utari     | cantik   | lucubanget@mailinator.com | 0      | 5     |         |                | 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users?FirstName={FirstName}&LastName={LastName}&Email={Email}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73601 check facebook verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Facebook"
	And I see the text "POST api/Verification/Facebook" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data for fb verification
	| userId                               | accessToken                                                                                                                                                                              | expireIn | signedRequest                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | userID          |
	| 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | EAAP53HQGjGoBALSrAmhvfudQt8VkfZBIeLBZAoYnsO1vg1GfhtdzhaglykuohH2rDK2JgXGfK5wDACHdyTh3pzMUqi3bVYAfsTxBrhnE6B1EwmAeRfoMKBSoOZCvJKZAMCZB0hpc4kxKrVkmFYlwecJNqsw6dbXGhCKZCmo5fRDZAsxKkp8uQ2I | 6749     | K10h3mKoN2rSRfA4788g_HpqOqbRG5rVPcSioloVq6I.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUNEd05xZDJHUzZTMHgwbmlOa1I4Q1hQOWgyTEhoNDQxdHdZc2w3eVdjOXZmbUIyZHhKZUtpUGs2WVk1dnVGMjlDdEVpQV8yUERWWU5kakJRQ3NGUWs2T0VQbGt1N3ppTE1XZ3NwVU16RjAzY1FKQnB4TnJLSVNwQ01DR0JRVElzaVhvQUJBUzVFUFhLbzhPUkw2UENtc04zNlNTNXBGLVJxQWFuc3JXRmhrbWtKS21sZDc4dFkzaG1Mem1OZ0wydjNDQXVyZ0VCRTR5TmIxbTNKcS1TU09MbjIyWWN5Mi1PbFNSN2NKQ0hESGZYNUxPdEdDZFpycjZUMHZZX2UzQlhKckQyUDRGcFQ5WGJVeC10eHR4V1JKM2lYLVpNOUZqR2hSLTlYaE50M2QyQVBsQmpWa1lNMzRPaHMwOEx4bmVzbV9XOFJMeVBwR1MyNk5fRFBuMGFSeiIsImlzc3VlZF9hdCI6MTQ3MDczMDA1MSwidXNlcl9pZCI6IjEyMjA1ODI1ODIzODcwNiJ9 | 122058258238706 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Facebook"
	And Status should be OK

Scenario: #73601 check facebook verification (friend less than 50)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Facebook"
	And I see the text "POST api/Verification/Facebook" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data for fb verification
	| userId                               | accessToken                                                                                                                                                                         | expireIn | signedRequest                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | userID          |
	| 61348e26-fa5a-4cd5-9d73-a97922a94920 | EAAP53HQGjGoBAGLqFKCtLErBFE3PNcv39KEHvzjjueaHBxNeSSSFvEbAoipaOGFZAtqOUoYiy2ZADyTWjeaCJjZAIprocfLZCh53qduoka5SkozISL35thhuei74EaoKOQFT1QYrjZAL2sR1gDwx3QJN6H94yJAL8heBPYgXJ1HQqCsZCzxj0y | 6890     | k_d-hSX0Rm1tlpA750h2HWoDBfX5Vi9r4Fa6YaRibJI.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUJvUW14VG1WYzJNMEYtSTEtUDl6V3o4bTRWR2EwdVVqUzFwd3Q0NklPSWVMdHo2eGNtbUFSUGJSSTFGMDFrRGJaX0Z1OFhfV3ZYZFFvTkJaYkkyYUlSWi1YSVRvOFF5UU5tQnVVaTJfSDRkSmt4V3dYYWRZY1NMZmVOVG9uVTBTUHJfeW5EeXdSSjZudTlneEVyRlhiS0FpTnIzRnFma0hWSGk3T3dWaXl6SU9pRVpma3diVzYtQmNDaWg4b2tBZkplN1h6V3ZmMC1QbTZIYlpwdHRWSnk5V0hISWNBcFR2T2lBUFhRQTI4WTBXaTRKU3RLRDBVUVVQYUZ3TjhNakl6TlZwelZNVldRMWFLRHFHcG1peFRUbUhnSlFpVUVMMThCSlBjZXZwUG9DbkpyYVU5ekRueF9lYTFYWEtCcXAzejJjZTY2OWEtenFxSGVtTk9WdWFBbyIsImlzc3VlZF9hdCI6MTQ3MDcyOTkxMCwidXNlcl9pZCI6IjExOTcyNjIwODQ2NzQ4MiJ9 | 119726208467482 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Facebook"
	And Status should be Bad Request

Scenario: #73601 check facebook verification (user not found)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Facebook"
	And I see the text "POST api/Verification/Facebook" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data for fb verification
	| userId                               | accessToken                                                                                                                                                                         | expireIn | signedRequest                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | userID          |
	| 61348e26-fa5a-4cd5-9d73-111111111111 | EAAP53HQGjGoBAGLqFKCtLErBFE3PNcv39KEHvzjjueaHBxNeSSSFvEbAoipaOGFZAtqOUoYiy2ZADyTWjeaCJjZAIprocfLZCh53qduoka5SkozISL35thhuei74EaoKOQFT1QYrjZAL2sR1gDwx3QJN6H94yJAL8heBPYgXJ1HQqCsZCzxj0y | 6890     | k_d-hSX0Rm1tlpA750h2HWoDBfX5Vi9r4Fa6YaRibJI.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUJvUW14VG1WYzJNMEYtSTEtUDl6V3o4bTRWR2EwdVVqUzFwd3Q0NklPSWVMdHo2eGNtbUFSUGJSSTFGMDFrRGJaX0Z1OFhfV3ZYZFFvTkJaYkkyYUlSWi1YSVRvOFF5UU5tQnVVaTJfSDRkSmt4V3dYYWRZY1NMZmVOVG9uVTBTUHJfeW5EeXdSSjZudTlneEVyRlhiS0FpTnIzRnFma0hWSGk3T3dWaXl6SU9pRVpma3diVzYtQmNDaWg4b2tBZkplN1h6V3ZmMC1QbTZIYlpwdHRWSnk5V0hISWNBcFR2T2lBUFhRQTI4WTBXaTRKU3RLRDBVUVVQYUZ3TjhNakl6TlZwelZNVldRMWFLRHFHcG1peFRUbUhnSlFpVUVMMThCSlBjZXZwUG9DbkpyYVU5ekRueF9lYTFYWEtCcXAzejJjZTY2OWEtenFxSGVtTk9WdWFBbyIsImlzc3VlZF9hdCI6MTQ3MDcyOTkxMCwidXNlcl9pZCI6IjExOTcyNjIwODQ2NzQ4MiJ9 | 119726208467482 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Facebook"
	And Status should be Bad Request

Scenario: #73601 check facebook verification (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Facebook"
	And I see the text "POST api/Verification/Facebook" in the page
	When I press test API button 
	And I input the user data for fb verification
	| userId                               | accessToken                                                                                                                                                                         | expireIn | signedRequest                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | userID          |
	| 61348e26-fa5a-4cd5-9d73-111111111111 | EAAP53HQGjGoBAGLqFKCtLErBFE3PNcv39KEHvzjjueaHBxNeSSSFvEbAoipaOGFZAtqOUoYiy2ZADyTWjeaCJjZAIprocfLZCh53qduoka5SkozISL35thhuei74EaoKOQFT1QYrjZAL2sR1gDwx3QJN6H94yJAL8heBPYgXJ1HQqCsZCzxj0y | 6890     | k_d-hSX0Rm1tlpA750h2HWoDBfX5Vi9r4Fa6YaRibJI.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUJvUW14VG1WYzJNMEYtSTEtUDl6V3o4bTRWR2EwdVVqUzFwd3Q0NklPSWVMdHo2eGNtbUFSUGJSSTFGMDFrRGJaX0Z1OFhfV3ZYZFFvTkJaYkkyYUlSWi1YSVRvOFF5UU5tQnVVaTJfSDRkSmt4V3dYYWRZY1NMZmVOVG9uVTBTUHJfeW5EeXdSSjZudTlneEVyRlhiS0FpTnIzRnFma0hWSGk3T3dWaXl6SU9pRVpma3diVzYtQmNDaWg4b2tBZkplN1h6V3ZmMC1QbTZIYlpwdHRWSnk5V0hISWNBcFR2T2lBUFhRQTI4WTBXaTRKU3RLRDBVUVVQYUZ3TjhNakl6TlZwelZNVldRMWFLRHFHcG1peFRUbUhnSlFpVUVMMThCSlBjZXZwUG9DbkpyYVU5ekRueF9lYTFYWEtCcXAzejJjZTY2OWEtenFxSGVtTk9WdWFBbyIsImlzc3VlZF9hdCI6MTQ3MDcyOTkxMCwidXNlcl9pZCI6IjExOTcyNjIwODQ2NzQ4MiJ9 | 119726208467482 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Facebook"
	And Status should be Unauthorized

Scenario: #73602 check school verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	|username|password|
	|kimwoobin|password| 
	And I input the user data for school verification
	| userId                               | name        | email                    | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verSchoolPhone | verContactPerson | verContactEmail                | verContactPhone |
	| 35de925a-5a29-4fed-9a07-ff4f128a0beb | kim woo bin | kimwoobin@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321     | test             | smacontactemail@mailinator.com | 0987654321      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #73602 check school verification (failed user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user data for school verification
	| userId                               | name  | email                     | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | educatorStatus |
	| 71a9424f-e9fb-4563-b4d4-111111111111 | utari | lucubanget@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com | 1              | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be Bad Request

Scenario: #73602 check school verification (failed user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I press test API button 
	And I input the user data for school verification
	| userId                               | name  | email                     | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | educatorStatus |
	| 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | utari | lucubanget@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com | 1              |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be Unauthorized

Scenario: #73602 check verify school verification (school working) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status"
	And I see the text "POST api/Verification/Confirmation/{token}?status={status}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the confrimation verification data
         | token                            | status        |
         | bf799570c15d4534a51864cbc5ed0b70 | SchoolWorking |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Confirmation/{token}?status={status}"
	And Status should be OK

Scenario: #73602 check verify school verification (school Retired) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status"
	And I see the text "POST api/Verification/Confirmation/{token}?status={status}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the confrimation verification data
         | token                            | status        |
         | 5201494abc034bd6aee4570139e852c5 | SchoolRetired |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Confirmation/{token}?status={status}"
	And Status should be OK

Scenario: #73602 check verify school verification (school never employed) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status"
	And I see the text "POST api/Verification/Confirmation/{token}?status={status}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the confrimation verification data
         | token                            | status              |
         | 3807da46f144429cb8525d7744786c4a | SchoolNeverEmployed |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Confirmation/{token}?status={status}"
	And Status should be OK

Scenario: #73602 check verify school verification (failed token invalid) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status"
	And I see the text "POST api/Verification/Confirmation/{token}?status={status}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the confrimation verification data
         | token     | status        |
         | poiuytrew | SchoolWorking |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/Confirmation/{token}?status={status}"
	And Status should be Bad Request

Scenario: #73643 check save testimonial
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId | username | firstName | lastName | shortDescription | description | approvedDate | createdDate |
	| 0  | 0  | 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #73643 check save testimonial (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId | username | firstName | lastName | shortDescription | description | approvedDate | createdDate |
	| 0  | 0  | 71a9424f-e9fb-4563-b4d4-111111111111 | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Bad Request

Scenario: #73643 check save testimonial (user is not login yet)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I press test API button 
	And I input testimonial data 
	| no | id | userId | username | firstName | lastName | shortDescription | description | approvedDate | createdDate |
	| 0  | 0  | 71a9424f-e9fb-4563-b4d4-111111111111 | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Unauthorized

Scenario: #73643 check update testimonial (change testimonial data)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username   | firstName | lastName | shortDescription         | description        | approvedDate | createdDate |
	| 0  | 1  | 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucubanget | urati     | cantik   | change short Description | change description | 2016-08-09   | 2016-08-09  | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #73643 check update testimonial (change user data)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username | firstName | lastName | shortDescription       | description      | approvedDate | createdDate |
	| 0  | 1  | 64060696-f58c-4126-9a91-c1325f2885f7 | testtest | test      | test     | test short Description | test description | 2016-08-09   | 2016-08-09  | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #73643 check update testimonial (change user data that not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username | firstName | lastName | shortDescription       | description      | approvedDate | createdDate |
	| 0  | 1  | 64060696-f58c-4126-9a91-111111111111 | testtest | test      | test     | test short Description | test description | 2016-08-09   | 2016-08-09  | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Bad Request

Scenario: #73643 check update testimonial (change user data and not login yet)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I press test API button 
	And I input testimonial data 
	| no | id | userId                               | username | firstName | lastName | shortDescription       | description      | approvedDate | createdDate |
	| 0  | 1  | 64060696-f58c-4126-9a91-c1325f2885f7 | testtest | test      | test     | test short Description | test description | 2016-08-09   | 2016-08-09  |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Unauthorized

Scenario: #73561 check get public profile 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be OK

Scenario: #73561 check get public profile (user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-111111111" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be Bad Request

Scenario: #73561 check get public profile (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I press test API button 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be Unauthorized

Scenario: #80339 check save listing (input address listing)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047" 
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be OK

Scenario: #80339 check save listing (using user address)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047"  
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | true           | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be OK

Scenario: #80339 check save listing (failed required field is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047" 
	And I input the listing data
	| title | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate | flexibilityDate | features | addressOne | addressTwo | houseNo | city | province | postalCode | latitude | longitude | countryId |
	|       | 4            | 4             | true      | true        | true           | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 |           | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be Bad Request

Scenario: #80339 check save listing (failed user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I press test API button 
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047" 
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be Unauthorized

Scenario: #80339 check save listing (user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-11111111111" 
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be Bad Request

Scenario: #80339 check save listing (failed user not member)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 0  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be Bad Request

Scenario: #80339 check edit listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047" 
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate   | flexibilityDate | features | addressOne | addressTwo | houseNo | city    | province  | postalCode | latitude   | longitude   | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 1  | 1       | 2016-08-2 | 2016-08-2 | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be OK

Scenario: #80339 check remove listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Save-userId"
	And I see the text "POST api/Listing/Save/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input the user Id "79ddc9d0-1d9b-4b7e-b2a7-48204eb44047"
	And I input the listing data
	| title              | numberPeople | numberBedRoom | undecided | publicShare | useUserAddress | id | orderNo | startDate | endDate | flexibilityDate | features | addressOne | addressTwo | houseNo | city | province | postalCode | latitude | longitude | countryId |
	| test Listing title | 4            | 4             | true      | true        | false          | 1  | 1       |           |         | 0               | 3,6,9    | garut      | bandung    | 42a     | Bandung | West Java | 12345      | -6.8791767 | 107.5849853 | 1003      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Save/{userId}"
	And Status should be OK

Scenario: #80992 check contact Us phone field
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-ContactUs-Submit"
	When I see the text "POST api/ContactUs/Submit" in the page
	Then I shouldn't see phone field 

Scenario: #80840 check delete image
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-Delete-imageId"
	And I see the text "POST api/Media/Images/Delete/{imageId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id "6FA45B80-FC6D-412A-A49B-068B5722FD5D" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/Delete/{imageId}"
	And Status should be OK 

Scenario: #73740 check set default image listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 1         | 8FCF62C0-58A8-46EB-8978-2B3EC5D24A67 | true      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be OK 

Scenario: #73740 check set default image listing (save as not default)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 2         | F0BE2E48-E4B6-4FCE-A488-2B789238F51B | false     | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be OK 

Scenario: #73740 check set default image listing (failed listing is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 999999    | F0BE2E48-E4B6-4FCE-A488-2B789238F51B | true      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be Bad Request 

Scenario: #73740 check set default image listing (failed image is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 3         | F0BE2E48-E4B6-4FCE-A488-999999999999 | true      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be Bad Request 

Scenario: #73740 check set default image listing (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I press test API button 
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 4         | 55ED8B95-411E-4162-BD62-C0E23A0ED120 | true      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be Unauthorized 

Scenario: #73736 check view user listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be OK

Scenario: #73736 check view user listing (failed user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-qqqqqqqqqqqqqqqqqqq"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be Bad Request

Scenario: #73736 check view user listing (failed user not logged) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I press test API button
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be Unauthorized

Scenario: #73733 check view user verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-userId"
	And I see the text "GET api/Verification/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/{userId}"
	And Status should be OK

Scenario: #73733 check view user verification (failed user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-userId"
	And I see the text "GET api/Verification/{userId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-qwertyuiop"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/{userId}"
	And Status should be Bad Request

Scenario: #73733 check view user verification (failed user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Verification-userId"
	And I see the text "GET api/Verification/{userId}" in the page
	When I press test API button
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Verification/{userId}"
	And Status should be Unauthorized

Scenario: #73731 check view user profile 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId"
	And I see the text "GET api/Users/{UserId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/{UserId}"
	And Status should be OK

Scenario: #73731 check view user profile (failed user not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId"
	And I see the text "GET api/Users/{UserId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input the user Id "71a9424f-e9fb-4563-b4d4-qwertyuiop"  
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/{UserId}"
	And Status should be Bad Request

Scenario: #73731 check view user profile (failed user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId"
	And I see the text "GET api/Users/{UserId}" in the page
	When I press test API button
	And I input the user Id "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/{UserId}"
	And Status should be Unauthorized

Scenario: #73569 check apply now with active membership 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	| username    | password |
	| sucitanuary | password |
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 13                    | test           | 2016-10-12 | 2016-10-18 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be OK

Scenario: #73569 check apply now again with same user (failed)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 1                     | test           | 2016-09-02 | 2016-09-02 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Bad Request

Scenario: #73569 check apply now with user that create the listing (failed)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 1                     | test           | 2016-09-02 | 2016-09-02 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Bad Request

Scenario: #73569 check apply now with not active membership 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 1                     | test           | 2016-09-02 | 2016-09-02 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Bad Request

Scenario: #73569 check apply now using date that not match
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 1                     | test           | 2016-08-31 | 2016-08-31 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Bad Request

Scenario: #73569 check apply now using listing that not exist
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 2                     | test           | 2016-08-31 | 2016-08-31 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Bad Request

Scenario: #73569 check apply now with user that not logged
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I press test API button
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 1                     | test           | 2016-09-02 | 2016-09-02 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be Unauthorized

Scenario: #74371 check accept booking 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Accept-bookingReference"
	And I see the text "POST api/Booking/Accept/{bookingReference}" in the page
	When I add header with token
	| username | password |
	| hhilmi   | password |
	And I input booking reference "5" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Accept/{bookingReference}"
	And Status should be OK

Scenario: #74371 check accept booking(failed) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Accept-bookingReference"
	And I see the text "POST api/Booking/Accept/{bookingReference}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input booking reference "99" 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Accept/{bookingReference}"
	And Status should be Not Found

Scenario: #74371 check accept booking(user not logged) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Accept-bookingReference"
	And I see the text "POST api/Booking/Accept/{bookingReference}" in the page
	When I press test API button
	And I input booking reference "99"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Accept/{bookingReference}"
	And Status should be Unauthorized

Scenario: #74365 check cancel booking by another user 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-HostCancel"
	And I see the text "POST api/Booking/HostCancel" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 3             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/HostCancel"
	And Status should be Bad Request

Scenario: #74365 check cancel booking 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-HostCancel"
	And I see the text "POST api/Booking/HostCancel" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 3             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/HostCancel"
	And Status should be OK

Scenario: #74365 check cancel booking failed
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-HostCancel"
	And I see the text "POST api/Booking/HostCancel" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 2             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/HostCancel"
	And Status should be Not Found
	
Scenario: #74365 check cancel booking user not logged 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-HostCancel"
	And I see the text "POST api/Booking/HostCancel" in the page
	When I press test API button
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 3             | test                 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/HostCancel"
	And Status should be Unauthorized

Scenario: #82025 update image listing
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 3         | BF6CDC7F-EB63-477D-B2A1-3A5DE8E5960C | true      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be OK

Scenario: #82025 update image listing(listing id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I add header with token
	|username|password|
	|anggraeni|password|
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 99        | BF6CDC7F-EB63-477D-B2A1-3A5DE8E5960C | true      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be Bad Request

Scenario: #82025 update image listing(user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-ImageListing-Save"
	And I see the text "POST api/Listing/ImageListing/Save" in the page
	When I press test API button
	And I input image listing data
	| listingId | imageId                              | isDefault |
	| 1         | 55ED8B95-411E-4162-BD62-C0E23A0ED120 | true      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/ImageListing/Save"
	And Status should be Unauthorized

Scenario: #73644 Approve testimonial 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonialApproval"
	And I see the text "POST api/Testimonial/UserTestimonialApproval" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username   | firstName | lastName | shortDescription       | description      | approvedDate | createdDate | approved |
	| 1  | 4  | 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | true     | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonialApproval"
	And Status should be OK

Scenario: #73644 Approve testimonial (testimonial is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonialApproval"
	And I see the text "POST api/Testimonial/UserTestimonialApproval" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username   | firstName | lastName | shortDescription       | description      | approvedDate | createdDate | approved |
	| 1  | 99 | 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | true     | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonialApproval"
	And Status should be Bad Request

Scenario: #73644 Approve testimonial (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonialApproval"
	And I see the text "POST api/Testimonial/UserTestimonialApproval" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input testimonial data 
	| no | id | userId                               | username   | firstName | lastName | shortDescription       | description      | approvedDate | createdDate | approved |
	| 1  | 4  | 71a9424f-e9fb-4563-b4d4-pppppppppppp | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | true     | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonialApproval"
	And Status should be Bad Request

Scenario: #73644 Approve testimonial (user is not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonialApproval"
	And I see the text "POST api/Testimonial/UserTestimonialApproval" in the page
	When I press test API button 
	And I input testimonial data 
	| no | id | userId                               | username   | firstName | lastName | shortDescription       | description      | approvedDate | createdDate | approved |
	| 1  | 4  | 71a9424f-e9fb-4563-b4d4-80f9f88d7e2e | lucubanget | urati     | cantik   | test short Description | test description | 2016-08-09   | 2016-08-09  | true     |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonialApproval"
	And Status should be Unauthorized

Scenario: #76498 check decline booking  
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Decline-bookingReference"
	And I see the text "POST api/Booking/Decline/{bookingReference}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input booking reference "4"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Decline/{bookingReference}"
	And Status should be OK

Scenario: #76498 check decline booking (booking has canceled)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Decline-bookingReference"
	And I see the text "POST api/Booking/Decline/{bookingReference}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input booking reference "3"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Decline/{bookingReference}"
	And Status should be Bad Request

Scenario: #76498 check decline booking(failed) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Decline-bookingReference"
	And I see the text "POST api/Booking/Decline/{bookingReference}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input booking reference "99"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Decline/{bookingReference}"
	And Status should be Not Found

Scenario: #76498 check decline booking(user not logged) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Decline-bookingReference"
	And I see the text "POST api/Booking/Decline/{bookingReference}" in the page
	When I press test API button
	And I input booking reference "99"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Decline/{bookingReference}"
	And Status should be Unauthorized

Scenario: #73613 check display user listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-User-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token 
	| username | password |
	| ridwan   | password |
	And I input the user Id "1ed19b8b-18eb-4add-9feb-942bb519e8f4" to the url
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #73613 check display user listing (failed user is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-User-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-qwertyuiop" to the url
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: #73613 check display user listing (failed user is not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-User-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6" to the url
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73590 check give testimonial
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input the testimonial 
	| userId                               | description |
	| 088e5415-7638-4d12-a892-63aa74fac537 | test        |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #73590 check give testimonial (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input the testimonial 
	| userId                               | description |
	| 088e5415-7638-4d12-a892-qwertyuiopas | test        |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Bad Request

Scenario: #73590 check give testimonial (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I press test API button
	And I input the testimonial 
	| userId                               | description |
	| 088e5415-7638-4d12-a892-63aa74fac537 | test        |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be Unauthorized

Scenario: #73578 check invite now
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I add header with token 
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the invitation data  
	| userId                               | email             | name     | message |
	| 93941e7b-c929-41ed-84e0-7d131527bc02 | kan@voxteneo.asia | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be OK
	And the data should see the data
	| userId                               | email             | name     | message |
	| 93941e7b-c929-41ed-84e0-7d131527bc02 | kan@voxteneo.asia | korytest | test    |

Scenario: #73578 check invite now (user has invited)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I add header with token 
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the invitation data  
	| userId                               | email             | name     | message |
	| 93941e7b-c929-41ed-84e0-7d131527bc02 | kan@voxteneo.asia | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be Bad Request
	And I should see the message "You already sent invitation for this person."

Scenario: #73578 check invite now (user already registered)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I add header with token 
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the invitation data  
	| userId                               | email              | name     | message |
	| 93941e7b-c929-41ed-84e0-7d131527bc02 | kan@mailinator.com | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be Bad Request
	And I should see the message "This email already registered as Educators Home Share Member."

Scenario: #73578 check invite now (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I add header with token 
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the invitation data  
	| userId                               | email             | name     | message |
	| 93941e7b-c929-41ed-84e0-poiuytrewoit | kan@voxteneo.asia | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be Bad Request
	And I should see the message "User account not found"

Scenario: #73578 check invite now (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I press test API button
	And I input the invitation data  
	| userId                               | email             | name     | message |
	| 93941e7b-c929-41ed-84e0-7d131527bc02 | kan@voxteneo.asia | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be Unauthorized

Scenario: #74327 check validate appy now button 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Validate-ApplyNow-listingAvailabilityId"
	And I see the text "GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And Input the listing avaliabiity id "3"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}"
	And Status should be OK

Scenario: #74327 check validate appy now button (ExpDate < StartDate)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Validate-ApplyNow-listingAvailabilityId"
	And I see the text "GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And Input the listing avaliabiity id "5"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}"
	And Status should be Bad Request
	And I should see the message "Membership has expired"

Scenario: #74327 check validate appy now button (User not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Validate-ApplyNow-listingAvailabilityId"
	And I see the text "GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}" in the page
	When I press test API button
	And Input the listing avaliabiity id "5"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Validate/ApplyNow/{listingAvailabilityId}"
	And Status should be Unauthorized

Scenario: #74375 check cancel booking by guest user by another user 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username | password |
	| zanardi  | password |
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 1             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Bad Request

Scenario: #74375 check cancel booking by guest (EndDate booking no longer avaliable)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 3             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Bad Request
	And I should see the message "The booking is no longer available"

	Scenario: #74375 check cancel booking by guest
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username  | password |
	| samuel | password |
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 2             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be OK
	And I should see the message "Succeed"

Scenario: #74375 check cancel booking by guest has canceled before
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username  | password |
	| samuel | password |
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 2             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Bad Request
	And I should see the message "The booking is no longer available" 

Scenario: #74375 check cancel booking by guest failed
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |  
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 99            | test                 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Not Found
	
Scenario: #74375 check cancel booking by guest user not logged 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I press test API button
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 3             | test                 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Unauthorized

Scenario: #74163 check extend membership by inviting someone
	Given I invite someone
	When someone do register as user 
	| firstName     | lastName     | username  | email                    | password     |
	| testfirstname | testLastname | bauketek12 | bauketek12@mailinator.com | testpassword |
	And user choose a plan 2
	And user send school verification
	| userId | name          | email                    | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | educatorStatus |
	|        | testfirstname | bauketek12@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com | 1              |
	And School confrim the user smacontactemail@mailinator.com
	Then I should get 30 days free

Scenario: #81264 check refferal code
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation"
	And I see the text "POST api/Users/Invitation" in the page
	When I press test API button
	And I input the invitation data
	| userId | email                    | name     | message |
	|        | korcantik@mailinator.com | korytest | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Invitation"
	And Status should be OK
	And The referal code should be appear in the email "korcantik@mailinator.com"

Scenario: #73734 check Edit User Verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user data for school verification
	| userId                               | name          | email              | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | VerContactPhone | educatorStatus |
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testfirstname | kan@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com | 0987654321      | 1              |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #73734 check Edit User Verification (VerContactPhone is string)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user data for school verification
	| userId                               | name          | email              | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | VerContactPhone | educatorStatus |
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testfirstname | kan@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com | qwertyuiop      | 1              |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #73734 check Edit User Verification(VerContactPhone is empty) 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user data for school verification
	| userId                               | name          | email              | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verContactPerson | verContactEmail                | VerContactPhone | educatorStatus |
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testfirstname | kan@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321       | smacontactemail@mailinator.com |                 | 1              |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be Bad Request

Scenario: #78978 check email booking request
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-ApplyBooking"
	And I see the text "POST api/Booking/ApplyBooking" in the page
	When I add header with token
	| username | password |
	| ridwan   | password |
	And I input listing avalibiity data
	| ListingAvailabilityId | BookingMessage | StartDate  | EndDate    |
	| 2                     | test           | 2016-10-10 | 2016-10-14 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/ApplyBooking"
	And Status should be OK

Scenario: #73096 check display testimonial
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonial"
	And I see the text "GET api/Testimonial/GetTestimonial" in the page
	When I press test API button
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonial"
	And Status should be OK
	And the result should show 5 data

Scenario: #74370 check view accept booking form 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Detail-bookingReference"
	And I see the text "GET api/Booking/Detail/{bookingReference}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input booking reference "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Detail/{bookingReference}"
	And Status should be OK

Scenario: #74370 check view accept booking form (booking reference is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Detail-bookingReference"
	And I see the text "GET api/Booking/Detail/{bookingReference}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input booking reference "99"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Detail/{bookingReference}"
	And Status should be Not Found

Scenario: #74370 check view accept booking form (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Detail-bookingReference"
	And I see the text "GET api/Booking/Detail/{bookingReference}" in the page
	When I press test API button
	And I input booking reference "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/Detail/{bookingReference}"
	And Status should be Unauthorized

Scenario: #83494 check result of view accept booking
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-Detail-bookingReference"
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input booking reference "1"
	And I click send button
	Then Status should be OK
	And I should see the username of the data 

Scenario: #79127 check school verification email
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user data for school verification
	| userId                               | name          | email                     | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verSchoolPhone | verContactPerson | verContactEmail                | verContactPhone | 
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testfirstname | lucubanget@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321     | aaa              | smacontactemail@mailinator.com | 0987654321      | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #83229 check display user listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Booking-List-User-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token 
	| username | password |
	| ridwan   | password |
	And I input the user Id "1ed19b8b-18eb-4add-9feb-942bb519e8f4" to the url
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Booking/List/User/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result should been have 2 data

Scenario: #84050 check display testimonial
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonial-total"
	And I see the text "GET api/Testimonial/GetTestimonial/{total}" in the page
	When I press test API button
	And I input total testimonial 4
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonial/{total}"
	And Status should be OK
	And the result should show 4 data

Scenario: #84038 check edit testimonial (chage to approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input edit testimonial data
	| id | desciption   | approved |
	| 2  | test approve | true     |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be OK

Scenario: #84038 check edit testimonial (chage to not approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input edit testimonial data
	| id | desciption   | approved |
	| 1  | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be OK

Scenario: #84038 check edit testimonial (testimonial is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input edit testimonial data
	| id | desciption   | approved |
	| 99 | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be Bad Request

Scenario: #84038 check edit testimonial (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I press test API button
	And I input edit testimonial data
	| id | desciption   | approved |
	| 1  | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be Unauthorized

Scenario: #83718 search listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Search"
	And I see the text "POST api/Listing/Search" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data listing(offset and limit)
	| Offset | Limit |
	| 0      | 12    | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Search"
	And Status should be OK
	And user id should be appear in the result

Scenario: #82035 check delete image that already saved on listing
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId                              | listingId |
	| 3969ABD1-5D64-4DEE-8939-0217C1151EAD | 1         |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be OK

Scenario: #82035 check delete image that already saved on listing (listing is not exist)
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId                              | listingId |
	| 3969ABD1-5D64-4DEE-8939-0217C1151EAD | 99        |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be Bad Request

Scenario: #82035 check delete image that already saved on listing (image is not exist)
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input image id and listing id
	| imageId                              | listingId |
	| 3969ABD1-5D64-4DEE-8939-098765432123 | 2         |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be Bad Request

Scenario: #82035 check delete image that already saved on listing (user not logged)
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Media-Images-DeleteListing-imageId_listingId"
	And I see the text "POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}" in the page
	When I press test API button
	And I input image id and listing id
	| imageId                              | listingId |
	| 3969ABD1-5D64-4DEE-8939-0217C1151EAD | 1         |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Media/Images/DeleteListing/{imageId}?listingId={listingId}"
	And Status should be Unauthorized

Scenario: #73570 check contact me
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-ContactMe"
	And I see the text "POST api/Users/ContactMe" in the page
	When I add header with token
	| username | password |
	| pedrosa  | password |
	And I input contact me data
	| ReceiverId                           | Subject     | Body      |
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testsubject | test body |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/ContactMe"
	And Status should be OK

Scenario: #73570 check contact me(receiver id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-ContactMe"
	And I see the text "POST api/Users/ContactMe" in the page
	When I add header with token
	| username | password |
	| pedrosa  | password |
	And I input contact me data
	| ReceiverId                           | Subject     | Body      |
	| 4504dd98-96b4-4509-a669-123456789000 | testsubject | test body |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/ContactMe"
	And Status should be Bad Request

Scenario: #73570 check contact me (user not login)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-ContactMe"
	And I see the text "POST api/Users/ContactMe" in the page
	When I press test API button
	And I input contact me data
	| ReceiverId                           | Subject     | Body      |
	| 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | testsubject | test body |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/ContactMe"
	And Status should be Unauthorized

Scenario: #73580 check get recommendation
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-userName"
	And I see the text "GET api/Users/Recommendation/{userName}" in the page
	When I add header with token
	| username | password |
	| pedrosa  | password |
	And I input username "anggraeni"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/{userName}"
	And Status should be OK

Scenario: #73580 check get recommendation (username is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-userName"
	And I see the text "GET api/Users/Recommendation/{userName}" in the page
	When I add header with token
	| username | password |
	| pedrosa  | password |
	And I input username "1234567890"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/{userName}"
	And Status should be Bad Request

Scenario: #73580 check get recommendation (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-userName"
	And I see the text "GET api/Users/Recommendation/{userName}" in the page
	When I press test API button
	And I input username "anggraeni"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/{userName}"
	And Status should be Unauthorized

Scenario: #74377 check view message in inbox
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetInbox_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to inbox
	| username | password |
	| anggraeni  | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the message data should be appear

Scenario: #74377 check view message in inbox (inbox is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetInbox_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to inbox
	| username  | password |
	| pedrosa | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should empty

Scenario: #74377 check view message in inbox (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetInbox_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the receiveid "qwertyuioppsdfghjkcvbnm" to inbox
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetInbox?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #74381 check view message in archive
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetArchived_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to archive
	| username | password |
	| anggraeni  | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the message data should be appear

Scenario: #74381 check view message in archive (archive is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetArchived_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to archive
	| username | password |
	| pedrosa  | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should empty

Scenario: #74381 check view message in archive (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetArchived_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the receiveid "qwertyuioppsdfghjkcvbnm" to archive
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetArchived?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #74382 check move message to archive
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToArchived"
	And I see the text "POST api/Messages/MoveToArchived" in the page
	When I input message id that want to moved 
	| messageId | username  | password |
	| 2         | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToArchived"
	And Status should be OK

Scenario: #74382 check move message to archive (message id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToArchived"
	And I see the text "POST api/Messages/MoveToArchived" in the page
	When I input message id that want to moved
	| messageId | username  | password |
	| 99        | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToArchived"
	And Status should be Bad Request

Scenario: #74382 check move message to archive (user have no message)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToArchived"
	And I see the text "POST api/Messages/MoveToArchived" in the page
	When I input message id that want to moved
	| messageId | username | password |
	| 2         | pedrosa  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToArchived"
	And Status should be Bad Request

Scenario: #74382 check move message to archive (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToArchived"
	And I see the text "POST api/Messages/MoveToArchived" in the page
	When I press test API button
	And I input message id "2" and received id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToArchived"
	And Status should be Unauthorized

Scenario: #74387 check move message to inbox
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToInbox"
	And I see the text "POST api/Messages/MoveToInbox" in the page
	When I input message id that want to moved
	| messageId | username  | password |
	| 2         | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToInbox"
	And Status should be OK

Scenario: #74387 check move message to inbox (message id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToInbox"
	And I see the text "POST api/Messages/MoveToInbox" in the page
	When I input message id that want to moved
	| messageId | username  | password |
	| 99        | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToInbox"
	And Status should be Bad Request

Scenario: #74387 check move message to inbox (user have no message)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToInbox"
	And I see the text "POST api/Messages/MoveToInbox" in the page
	When I input message id that want to moved
	| messageId | username | password |
	| 2         | pedrosa  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToInbox"
	And Status should be Bad Request

Scenario: #74387 check move message to inbox (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToInbox"
	And I see the text "POST api/Messages/MoveToInbox" in the page
	When I press test API button
	And I input message id "2" and received id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToInbox"
	And Status should be Unauthorized

Scenario: #75001 check move message to trash
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToTrash"
	And I see the text "POST api/Messages/MoveToTrash" in the page
	When I input message id that want to moved
	| messageId | username  | password |
	| 2         | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToTrash"
	And Status should be OK

Scenario: #75001 check move message to trash (message id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToTrash"
	And I see the text "POST api/Messages/MoveToTrash" in the page
	When I input message id that want to moved
	| messageId | username  | password |
	| 99        | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToTrash"
	And Status should be Bad Request

Scenario: #75001 check move message to trash (user have no message)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToTrash"
	And I see the text "POST api/Messages/MoveToTrash" in the page
	When I input message id that want to moved
	| messageId | username | password |
	| 2         | pedrosa  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToTrash"
	And Status should be Bad Request

Scenario: #75001 check move message to trash (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-MoveToTrash"
	And I see the text "POST api/Messages/MoveToTrash" in the page
	When I press test API button
	And I input message id "2" and received id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/MoveToTrash"
	And Status should be Unauthorized

Scenario: #74388 check delete massage
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-Delete"
	And I see the text "POST api/Messages/Delete" in the page
	When I input message id that want to delete
	| messageId | username  | password |
	| 2         | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/Delete"
	And Status should be OK

Scenario: #74388 check delete massage (message id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-Delete"
	And I see the text "POST api/Messages/Delete" in the page
	When I input message id that want to delete
	| messageId | username | password |
	| 99        | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/Delete"
	And Status should be Bad Request

Scenario: #74388 check delete massage (user have no messages)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-Delete"
	And I see the text "POST api/Messages/Delete" in the page
	When I input message id that want to delete
	| messageId | username | password |
	| 2         | pedrosa  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/Delete"
	And Status should be Bad Request

Scenario: #74388 check delete massage (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Messages-Delete"
	And I see the text "POST api/Messages/Delete" in the page
	When I press test API button
	And I input message id "2" and received id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Messages/Delete"
	And Status should be Unauthorized

Scenario: #74998 check view message in trash
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetTrash_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to trash
	| username | password |
	| anggraeni  | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the message data should be appear

Scenario: #74998 check view message in trash (trash is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetTrash_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input received id to trash
	| username  | password |
	| pedrosa | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should empty

Scenario: #74998 check view message in trash (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetTrash_ReceiverId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the receiveid "qwertyuioppsdfghjkcvbnm" to trash
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetTrash?ReceiverId={ReceiverId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #80334 check source data 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-StaticPages-GetPhotoCredits"
	And I see the text "GET api/StaticPages/GetPhotoCredits" in the page
	When I press test API button
	And I click send button
	Then The result pop-up should be opened "Response for GET api/StaticPages/GetPhotoCredits"
	And Status should be OK
	And source should be appear

Scenario: #74394 check display review for me
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input user id to show review for me
	| username | password |
	| anggraeni  | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should be appear

Scenario: #74394 check display review for me (review is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input user id to show review for me
	| username   | password |
	| korycantik | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should empty

Scenario: #74394 check display review for me (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the userid "qwertyuioppsdfghjkcvbnm" to show review for me
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #74395 check display review from me
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input user id to show review from me
	| username | password |
	| hhilmi   | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should be appear

Scenario: #74395 check display review from me (review is empty)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I input user id to show review from me
	| username   | password |
	| korycantik | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the data should empty

Scenario: #74395 check display review from me (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-FromMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the userid "qwertyuioppsdfghjkcvbnm" to show review from me
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/FromMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73572 check report
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Report"
	And I see the text "POST api/Users/Report" in the page
	When I input user id to report
	| userIdToReport                       | subject | message     | username  | password |
	| aba4e1e1-6651-4e7b-9283-f805b4e4bc06 | test    | test report | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Report"
	And Status should be OK

Scenario: #73572 check report(user to report is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Report"
	And I see the text "POST api/Users/Report" in the page
	When I input user id to report
	| userIdToReport                       | subject | message     | username  | password |
	| aba4e1e1-6651-4e7b-9283-qwertyuiopoi | test    | test report | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Report"
	And Status should be Bad Request

Scenario: #73572 check report(subject and message is blank)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Report"
	And I see the text "POST api/Users/Report" in the page
	When I input user id to report
	| userIdToReport                       | subject | message | username  | password |
	| aba4e1e1-6651-4e7b-9283-f805b4e4bc06 |         |         | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Report"
	And Status should be Bad Request

Scenario: #73572 check report (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Report"
	And I see the text "POST api/Users/Report" in the page
	When I press test API button
	And I input userid to report
	| userIdToReport                       | userIdReported                       | subject | message     |
	| aba4e1e1-6651-4e7b-9283-f805b4e4bc06 | 4504dd98-96b4-4509-a669-9c05e7ec3aa6 | test    | test report | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Report"
	And Status should be Unauthorized

Scenario: #72970 check payment paypal
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I input paypal data 
	| PlanId | transactionid     | username  | password |
	| 2      | 2L310270E7559882C | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be OK

Scenario: #72970 check payment paypal (plan not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I input paypal data 
	| PlanId | transactionid     | username  | password |
	| 10     | 2L310270E7559882C | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Bad Request

Scenario: #72970 check payment paypal (transaction not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I input paypal data 
	| PlanId | transactionid | username  | password |
	| 2      | 1234567890    | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Bad Request

Scenario: #72970 check payment paypal (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I press test API button 
	And I input data of paypal  
	| PlanId                               | transactionid | userId              |
	| aba4e1e1-6651-4e7b-9283-f805b4e4bc06 | test          | qwertyuiop123456789 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Unauthorized

Scenario: #85038 search listing (filter using more than one feature)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Search_UserName_Destination_DateFrom_DateTo_NumberPeople_NumberBedRoom_LengthOfStay_IsFlexibleLengthOfStay_Features_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Search?UserName={UserName}&Destination={Destination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search data listing
	| userName | destination | dateFrom   | dateTo     | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	|          | Bandung     | 2016-10-11 | 2016-10-13 | 1            | 1             | 1            | true                   | 8,10,11  | 0      | 10    |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Search?UserName={UserName}&Destination={Destination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #85038 search public listing (filter using more than one feature)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-SearchPublic_UserName_Destination_DateFrom_DateTo_NumberPeople_NumberBedRoom_LengthOfStay_IsFlexibleLengthOfStay_Features_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/SearchPublic?UserName={UserName}&Destination={Destination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	|username|password|
	|anggraeni|password| 
	And I input search public data listing
	| userName | destination | dateFrom   | dateTo     | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	|          | Bandung     | 2016-10-11 | 2016-10-13 | 1            | 1             | 1            | true                   | 8,10,11  | 0      | 10    |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/SearchPublic?UserName={UserName}&Destination={Destination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #81347 check create testimonial 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-UserTestimonial"
	And I see the text "POST api/Testimonial/UserTestimonial" in the page
	When I input testimonial data 
	| description        | approved | username  | password |
	| change description | false    | anggraeni | password |          
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/UserTestimonial"
	And Status should be OK

Scenario: #81347 check update testimonial 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I input edit testimonial data 
	| id | description        | approved | username  | password |
	| 1  | change description | true     | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be OK

Scenario: #85259 check report
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Report"
	And I see the text "POST api/Users/Report" in the page
	When I input user id to report
	| userIdToReport                       | subject | message     | username  | password |
	| aba4e1e1-6651-4e7b-9283-f805b4e4bc06 | test    | test report | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Report"
	And Status should be OK

Scenario: #84846 check contact us email receiver
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-ContactUs-Submit"
	And I see the text "POST api/ContactUs/Submit" in the page
	When I press test API button
	And I input contact us data
	| email             | firstName | lastName  | message         |
	| kan@voxteneo.asia | kory      | anggraeni | test contact us |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/ContactUs/Submit"
	And Status should be OK

Scenario: #74685 check register user(password less than 8 character)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Register"
	And I see the text "POST api/Account/Register" in the page
	When I press test API button
	And input the register data 
	| firstName | lastName | username | email                   | password |
	| bau       | ketek    | bauketek | bauketek@mailinator.com | 123456   |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Account/Register"
	And Status should be Bad Request

Scenario: #74684 check register user(username longer than 15 character)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Register"
	And I see the text "POST api/Account/Register" in the page
	When I press test API button
	And input the register data 
	| firstName | lastName | username            | email                   | password |
	| bau       | ketek    | bauketekbanget12345 | bauketek@mailinator.com | 12345678 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Account/Register"
	And Status should be Bad Request

Scenario: #85471 check update last login date
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Login" 
	And I see the text "POST api/Account/Login" in the page  
	When I press test API button
	And I input the username and password 
	| username  | password |
	| anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Account/Login"
	And Status should be OK

Scenario: #84840 check decline booking email  
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Decline-bookingReference"
	And I see the text "POST api/Booking/Decline/{bookingReference}" in the page
	When I add header with token 
	| username  | password |
	| anggraeni | password |
	And I input booking reference "10"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Decline/{bookingReference}"
	And Status should be OK

Scenario: #84839 check orientation image in country
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Country-countryId"
	And I see the text "GET api/Country/{countryId}" in the page
	When I press test API button
	And I input country Id "66"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Country/{countryId}"
	And Status should be OK
	And I should the image orientation

Scenario: #84839 check orientation image in news
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-News-id"
	And I see the text "GET api/News/{id}" in the page
	When I press test API button
	And I input news id "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/News/{id}"
	And Status should be OK
	And I should the image orientation

Scenario: #84839 check view listing detail API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Detail-userId"
	And I see the text "GET api/Listing/Detail/{userId}" in the page
	When I input the user Id 
	|username|password|
	|anggraeni|password| 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Detail/{userId}"
	And Status should be OK
	And I should the image orientation in listing data

Scenario: #83362 check cancel booking by guest user by another user 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-GuestCancel"
	And I see the text "POST api/Booking/GuestCancel" in the page
	When I add header with token
	| username | password |
	| bamsoek  | password |
	And I input cancel booking  data
	| BookReference | BookingCancelMessage |
	| 9             | test                 | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/GuestCancel"
	And Status should be Unauthorized

Scenario: #73755 create new voucher 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserId                  | VoucherLength | Expired | username         | password      |
	| ojan1236      | test   | kimwoobin@mailintor.com | 3             | 1       | EHSAdministrator | pass@word2016 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be OK

Scenario: #73755 create new voucher (voucher is already exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserId                               | VoucherLength | Expired | username         | password      |
	| 12345678      | test   | 289aa78b-4386-46ab-b85e-a3313d4ba19b | 3             | 1       | EHSAdministrator | pass@word2016 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be Bad Request

Scenario: #73755 create new voucher (voucher is already exist and voucher is already expired)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserId                               | VoucherLength | Expired | username         | password      |
	| 12345679      | test   | 289aa78b-4386-46ab-b85e-a3313d4ba19b | 3             | 1       | EHSAdministrator | pass@word2016 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be Bad Request

Scenario: #73755 create new voucher (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I press test API button 
	And I input voucherdata 
	| VoucherNumber | Reason | UserId                               | VoucherLength | Expired | 
	| 12345677      | test   | 289aa78b-4386-46ab-b85e-a3313d4ba19b | 3             | 1       | 
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be Unauthorized

Scenario: #73755 create new voucher (user logged as user)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserId                               | VoucherLength | Expired | username  | password |
	| 12345677      | test   | 289aa78b-4386-46ab-b85e-a3313d4ba19b | 3             | 1       | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be Unauthorized

Scenario: #73589 check claim voucher (voucher number is not found)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I input voucher number data 
	| VoucherNumber | username  | password |
	| 99999999      | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be Bad Request

Scenario: #73589 check claim voucher (voucher is already expired)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I input voucher number data 
	| VoucherNumber | username | password |
	| 12345679      | bamsoek  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be Bad Request

Scenario: #73589 check claim voucher (not valid user for this voucher)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I input voucher number data 
	| VoucherNumber | username | password |
	| 12345678      | bamsoek  | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be Bad Request

Scenario: #73589 check claim voucher (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I press test API button 
	And I input vouchernumber data "12345678"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be Unauthorized

Scenario: #73589 check claim voucher 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I input voucher number data 
	| VoucherNumber | username  | password |
	| 12345678      | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be OK

Scenario: #73589 check claim voucher (voucher has been claimed)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Claim-voucherNumber"
	And I see the text "POST api/Voucher/Claim/{voucherNumber}" in the page
	When I input voucher number data 
	| VoucherNumber | username  | password |
	| 12345678      | anggraeni | password |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Claim/{voucherNumber}"
	And Status should be Bad Request

Scenario: #74669 check export membership to excel
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-ExportExcel-userId"
	And I see the text "GET api/Memberships/ExportExcel/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/ExportExcel/{userId}"
	And Status should be OK

Scenario: #74669 check export membership to excel (user are not membership)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-ExportExcel-userId"
	And I see the text "GET api/Memberships/ExportExcel/{userId}" in the page
	When I press test API button 
	And I input the user Id "077e3c93-a17d-47a2-b1ad-6af4f2c2866f"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/ExportExcel/{userId}"
	And Status should be Bad Request

Scenario: #81251 check school verification 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username | password |
	| bamsoek  | password |
	And I input the user data for school verification
	| userId                               | name    | email            | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verSchoolPhone | verContactPerson | verContactEmail                | verContactPhone |
	| 077e3c93-a17d-47a2-b1ad-6af4f2c2866f | bambang | poer91@gmail.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321     | bambang          | smacontactemail@mailinator.com | 0987654321      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #84502 check give review
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Listing-Review-Save"
	And I see the text "POST api/Listing/Review/Save" in the page
	When I input the review 
	| username   | password | BookReference | AccuracyScore | CommunicationScore | CleanlinessScore | LocationScore | ArrivalScore | Review |
	| yooneunhye | password | 65            | 2             | 3                  | 5                | 4             | 1            | test   |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Listing/Review/Save"
	And Status should be OK

Scenario: #84435 check get testimonial by user id
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonialByUser-userId"
	And I see the text "GET api/Testimonial/GetTestimonialByUser/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonialByUser/{userId}"
	And Status should be OK

Scenario: #84435 check get testimonial by user id (login using user not admin)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonialByUser-userId"
	And I see the text "GET api/Testimonial/GetTestimonialByUser/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonialByUser/{userId}"
	And Status should be Unauthorized

Scenario: #84435 check get testimonial by user id (user have not testimonial data)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonialByUser-userId"
	And I see the text "GET api/Testimonial/GetTestimonialByUser/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the user Id "35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonialByUser/{userId}"
	And Status should be OK
	And data should be empty

Scenario: #84435 check get testimonial by user id (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonialByUser-userId"
	And I see the text "GET api/Testimonial/GetTestimonialByUser/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the user Id "4504dd98-96b4-4509-a669-1234567890"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonialByUser/{userId}"
	And Status should be Bad Request

Scenario: #84435 check get testimonial by user id (user not login)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-GetTestimonialByUser-userId"
	And I see the text "GET api/Testimonial/GetTestimonialByUser/{userId}" in the page
	When I press test API button 
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/GetTestimonialByUser/{userId}"
	And Status should be Unauthorized

Scenario: #73754 display of voucher 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Voucher-Search_VoucherNumber_IdStart_IdEnd_CreatedDateStart_CreatedDateEnd_ExpiredDateStart_ExpiredDateEnd_LengthStart_LengthEnd_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Voucher/Search?VoucherNumber={VoucherNumber}&IdStart={IdStart}&IdEnd={IdEnd}&CreatedDateStart={CreatedDateStart}&CreatedDateEnd={CreatedDateEnd}&ExpiredDateStart={ExpiredDateStart}&ExpiredDateEnd={ExpiredDateEnd}&LengthStart={LengthStart}&LengthEnd={LengthEnd}&Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the api link "api/Voucher/Search/?Offset=0&Limit=10"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Voucher/Search?VoucherNumber={VoucherNumber}&IdStart={IdStart}&IdEnd={IdEnd}&CreatedDateStart={CreatedDateStart}&CreatedDateEnd={CreatedDateEnd}&ExpiredDateStart={ExpiredDateStart}&ExpiredDateEnd={ExpiredDateEnd}&LengthStart={LengthStart}&LengthEnd={LengthEnd}&Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #78912 check email setting page 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-EmailSetting-Get-userId"
	And I see the text "GET api/EmailSetting/Get/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/EmailSetting/Get/{userId}"
	And Status should be OK

Scenario: #78912 check email setting page (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-EmailSetting-Get-userId"
	And I see the text "GET api/EmailSetting/Get/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-qwertyuioplkjhgfd"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/EmailSetting/Get/{userId}"
	And Status should be Bad Request

Scenario: #78912 check email setting page (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-EmailSetting-Get-userId"
	And I see the text "GET api/EmailSetting/Get/{userId}" in the page
	When I press test API button
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/EmailSetting/Get/{userId}"
	And Status should be Unauthorized

Scenario: #78912 check email setting save 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-EmailSetting-UserEmailSetting-Save-userId"
	And I see the text "POST api/EmailSetting/UserEmailSetting/Save/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I input email setting
	| emailSettingId | Active |
	| 1              | true   |
	| 2              | true   |
	| 3              | true   |
	| 4              | false  |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/EmailSetting/UserEmailSetting/Save/{userId}"
	And Status should be OK

Scenario: #73585 give recommendation
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Recommendation-Save"
	And I see the text "POST api/Users/Recommendation/Save" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the recommendation
	| listingId | Message             |
	| 15        | test recommendation |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Recommendation/Save"
	And Status should be OK

Scenario: #73585 give recommendation (listing ID is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Recommendation-Save"
	And I see the text "POST api/Users/Recommendation/Save" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the recommendation
	| listingId | Message             |
	| qwerty    | test recommendation |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Recommendation/Save"
	And Status should be Bad Request

Scenario: #73585 give recommendation (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Recommendation-Save"
	And I see the text "POST api/Users/Recommendation/Save" in the page
	When I press test API button
	And I input the recommendation
	| listingId | Message             |
	| 15        | test recommendation |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Recommendation/Save"
	And Status should be Unauthorized

Scenario: #74492 check display recommendation 
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Recommendations"
	And I see the text "POST api/Users/Recommendations" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the recommendation for display
	| Offset | Limit | OrderBy | OrderDirection | Lang |
	| 0      | 10    |         |                |      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Recommendations"
	And Status should be OK

Scenario: #74492 check display recommendation (user not logged)
Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Recommendations"
	And I see the text "POST api/Users/Recommendations" in the page
	When I press test API button
	And I input the recommendation for display
	| Offset | Limit | OrderBy | OrderDirection | Lang |
	| 0      | 10    |         |                |      |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/Recommendations"
	And Status should be Unauthorized

Scenario: #87954 check delete account failed (password is wrong)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I input the user to delete
	| username   | password | passwordverification |
	| korycantik | password | 1234567890           |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be Bad Request

Scenario: #87954 check delete account 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/DELETE-api-Account-DeleteUser"
	And I see the text "DELETE api/Account/DeleteUser" in the page
	When I input the user to delete
	| username   | password | passwordverification |
	| korycantik | password | password             |
	And I click send button
	Then The result pop-up should be opened "Response for DELETE api/Account/DeleteUser"
	And Status should be OK

Scenario: #89430 check email setting page (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-EmailSetting-Get-userId"
	And I see the text "GET api/EmailSetting/Get/{userId}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input the user Id "4504dd98-96b4-4509-a669-qwertyuioplkjhgfd"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/EmailSetting/Get/{userId}"
	And Status should be Bad Request

Scenario: #89170 display of voucher 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Voucher-Search_VoucherNumber_IdStart_IdEnd_CreatedDateStart_CreatedDateEnd_ExpiredDateStart_ExpiredDateEnd_LengthStart_LengthEnd_Status_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Voucher/Search?VoucherNumber={VoucherNumber}&IdStart={IdStart}&IdEnd={IdEnd}&CreatedDateStart={CreatedDateStart}&CreatedDateEnd={CreatedDateEnd}&ExpiredDateStart={ExpiredDateStart}&ExpiredDateEnd={ExpiredDateEnd}&LengthStart={LengthStart}&LengthEnd={LengthEnd}&Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the api link "api/Voucher/Search"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Voucher/Search?VoucherNumber={VoucherNumber}&IdStart={IdStart}&IdEnd={IdEnd}&CreatedDateStart={CreatedDateStart}&CreatedDateEnd={CreatedDateEnd}&ExpiredDateStart={ExpiredDateStart}&ExpiredDateEnd={ExpiredDateEnd}&LengthStart={LengthStart}&LengthEnd={LengthEnd}&Status={Status}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #88283 check unread message 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-Unread-userId"
	And I see the text "GET api/Messages/Unread/{userId}" in the page
	When  I input the user Id
	| username  | password |
	| kimwoobin | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/Unread/{userId}"
	And Status should be OK

Scenario: #88283 check unread message (user id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-Unread-userId"
	And I see the text "GET api/Messages/Unread/{userId}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I input the user Id "qwertyuisdfghjxcvbndfgh"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/Unread/{userId}"
	And Status should be Bad Request

Scenario: #88283 check unread message (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-Unread-userId"
	And I see the text "GET api/Messages/Unread/{userId}" in the page
	When I press test API button
	And I input the user Id "4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/Unread/{userId}"
	And Status should be Unauthorized

Scenario: #73747 check search and view recommendation 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-Search_HostUserId_StartDate_EndDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the api link "api/Users/Recommendation/Search?Offset=0&Limit=10"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #73747 check search and view recommendation (per user id)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-Search_HostUserId_StartDate_EndDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the api link "api/Users/Recommendation/Search?HostUserId=35de925a-5a29-4fed-9a07-ff4f128a0beb&Offset=0&Limit=10"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #73747 check search and view recommendation (not using admin account)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-Search_HostUserId_StartDate_EndDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I input the api link "api/Users/Recommendation/Search?Offset=0&Limit=10"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73747 check search and view recommendation (limit and offset is null)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-Search_HostUserId_StartDate_EndDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the api link "api/Users/Recommendation/Search"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: #73747 check search and view recommendation (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-Recommendation-Search_HostUserId_StartDate_EndDate_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input the api link "api/Users/Recommendation/Search?Offset=0&Limit=10"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Users/Recommendation/Search?HostUserId={HostUserId}&StartDate={StartDate}&EndDate={EndDate}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #90127 check country code 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Country-PhoneCode"
	And I see the text "GET api/Country/PhoneCode" in the page
	When I add header with token
	| username   | password |
	| yooneunhye | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Country/PhoneCode"
	And Status should be OK

Scenario: #90127 check country code (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Country-PhoneCode"
	And I see the text "GET api/Country/PhoneCode" in the page
	When I press test API button 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Country/PhoneCode"
	And Status should be Unauthorized

Scenario: #73745 view testimonial 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-View-id"
	And I see the text "GET api/Testimonial/View/{id}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the testimonial id "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/View/{id}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #73745 view testimonial (testimonial not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-View-id"
	And I see the text "GET api/Testimonial/View/{id}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the testimonial id "p899876tt678iu8"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/View/{id}"
	And Status should be Bad Request

Scenario: #73745 view testimonial (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Testimonial-View-id"
	And I see the text "GET api/Testimonial/View/{id}" in the page
	When I press test API button
	And I input the testimonial id "1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Testimonial/View/{id}"
	And Status should be Unauthorized

Scenario: #73745 check edit testimonial (chage to approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input edit testimonial data
	| id | description  | approved |
	| 2  | test approve | true     |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be OK

Scenario: #73745 check edit testimonial (chage to not approved)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input edit testimonial data
	| id | description  | approved |
	| 1  | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be OK

Scenario: #73745 check edit testimonial (testimonial is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input edit testimonial data
	| id  | description  | approved |
	| 9g9 | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be Bad Request

Scenario: #73745 check edit testimonial (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Testimonial-Edit"
	And I see the text "POST api/Testimonial/Edit" in the page
	When I press test API button
	And I input edit testimonial data
	| id | description  | approved |
	| 1  | test approve | false    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Testimonial/Edit"
	And Status should be Unauthorized

Scenario: #92320 check user message 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-ContactMe"
	And I see the text "POST api/Users/ContactMe" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I input contact me data
	| ReceiverId                           | Subject     | Body      |
	| 26987957-15b3-40ac-bd6e-b31a0987666e | testsubject | test body |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Users/ContactMe"
	And Status should be Bad Request
	And I should see the msg ""user is not active anymore""

Scenario: #73636 check generate list 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-AccountingInformation_DateFrom_DateTo_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Memberships/AccountingInformation?DateFrom=21/10/2016&DateTo=21/10/2016"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #73636 check generate list (login as user)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-AccountingInformation_DateFrom_DateTo_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I send the url "api/Memberships/AccountingInformation"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73636 check generate list (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-AccountingInformation_DateFrom_DateTo_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I send the url "api/Memberships/AccountingInformation?DateFrom=21/10/2016&DateTo=21/10/2016"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73648 check view list of listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Manage-View_Listing_Title_Description_Country_Undecided_DateFrom_DateTo_Shared_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Listing/Manage/View"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #73648 check view list of listing (login as user)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Manage-View_Listing_Title_Description_Country_Undecided_DateFrom_DateTo_Shared_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I send the url "api/Listing/Manage/View"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #73648 check view list of listing (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Manage-View_Listing_Title_Description_Country_Undecided_DateFrom_DateTo_Shared_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I send the url "api/Listing/Manage/View"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Manage/View?Listing={Listing}&Title={Title}&Description={Description}&Country={Country}&Undecided={Undecided}&DateFrom={DateFrom}&DateTo={DateTo}&Shared={Shared}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #91856 check sent message
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetSent_SenderId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I open sent folder
	| username  | password |
	| kimwoobin | password |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #91856 check sent message (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetSent_SenderId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I send the url "api/Messages/GetSent?SenderId=234567uhgfde56uhg6uhgtuijhyuhy"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: #91856 check sent message (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Messages-GetSent_SenderId_SearchKey_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button 
	And I send the url "api/Messages/GetSent?SenderId=4504dd98-96b4-4509-a669-9c05e7ec3aa6"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Messages/GetSent?SenderId={SenderId}&SearchKey={SearchKey}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #92756 create new voucher using email
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserNameEmail            | VoucherLength | Expired | username         | password      |
	| kwb12346      | test   | seoinguk@mailinator.com | 3             | 1       | EHSAdministrator | pass@word2016 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be OK

Scenario: #92756 create new voucher using username
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Voucher-Create"
	And I see the text "POST api/Voucher/Create" in the page
	When I input voucher data 
	| VoucherNumber | Reason | UserNameEmail | VoucherLength | Expired | username         | password      |
	| kwb12345      | test   | seoinguk     | 3             | 1       | EHSAdministrator | pass@word2016 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Voucher/Create"
	And Status should be OK

Scenario: #93083 search listing 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Search_UserName_Destination_UserDestination_DateFrom_DateTo_NumberPeople_NumberBedRoom_LengthOfStay_IsFlexibleLengthOfStay_Features_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Search?UserName={UserName}&Destination={Destination}&UserDestination={UserDestination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I input search data listing
	| userName | destination | UserDestination | dateFrom | dateTo | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	|          |             | seoinguk        |          |        |              |               |              |                        |          |        | 0     |
	Then The result pop-up should be opened "Response for GET api/Listing/Search?UserName={UserName}&Destination={Destination}&UserDestination={UserDestination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #93083 search listing public
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-SearchPublic_UserName_Destination_UserDestination_DateFrom_DateTo_NumberPeople_NumberBedRoom_LengthOfStay_IsFlexibleLengthOfStay_Features_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/SearchPublic?UserName={UserName}&Destination={Destination}&UserDestination={UserDestination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I input search public data listing
	| userName | destination | UserDestination | dateFrom | dateTo | numberPeople | numberBedRoom | lengthOfStay | isFlexibleLengthOfStay | Features | Offset | Limit |
	|          |             | bandung         |          |        |              |               |              |                        |          |        |       |
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/SearchPublic?UserName={UserName}&Destination={Destination}&UserDestination={UserDestination}&DateFrom={DateFrom}&DateTo={DateTo}&NumberPeople={NumberPeople}&NumberBedRoom={NumberBedRoom}&LengthOfStay={LengthOfStay}&IsFlexibleLengthOfStay={IsFlexibleLengthOfStay}&Features={Features}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK

Scenario: #93380 check expired to review 14 days after email to give review has been send
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Review-IsExpired-bookReff"
	And I see the text "POST api/Booking/Review/IsExpired/{bookReff}" in the page
	When I add header with token
	| username    | password |
	| sucitanuary | password |
	And I send the url "api/Booking/Review/IsExpired/40"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Review/IsExpired/{bookReff}"
	And Status should be OK
	And the result should be "true"

Scenario: #93380 check expired to review 14 days after email to give review has been send (not expired yet)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Review-IsExpired-bookReff"
	And I see the text "POST api/Booking/Review/IsExpired/{bookReff}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I send the url "api/Booking/Review/IsExpired/99"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Review/IsExpired/{bookReff}"
	And Status should be OK
	And the result should be "false"

Scenario: #93380 check expired to response 14 days after email to give response has been send
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Response-IsExpired-bookReff"
	And I see the text "POST api/Booking/Response/IsExpired/{bookReff}" in the page
	When I add header with token
	| username | password |
	| ridwan   | password |
	And I send the url "api/Booking/Response/IsExpired/40"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Response/IsExpired/{bookReff}"
	And Status should be OK
	And the result should be "true"

Scenario: #93380 check expired to response 14 days after email to give response has been send (not expired yet)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Booking-Response-IsExpired-bookReff"
	And I see the text "POST api/Booking/Response/IsExpired/{bookReff}" in the page
	When I add header with token
	| username   | password |
	| yooneunhye | password |
	And I send the url "api/Booking/Response/IsExpired/99"
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Booking/Response/IsExpired/{bookReff}"
	And Status should be OK
	And the result should be "false"

Scenario: #92615 View Review Details
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Detail-id"
	And I see the text "GET api/Listing/Review/Detail/{id}" in the page
	When I add header with token
	| username   | password |
	| yooneunhye | password |
	And I send the url "api/Listing/Review/Detail/1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Detail/{id}"
	And Status should be OK
	
Scenario: #92615 View Review Details (review not found)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Detail-id"
	And I see the text "GET api/Listing/Review/Detail/{id}" in the page
	When I add header with token
	| username   | password |
	| yooneunhye | password |
	And I send the url "api/Listing/Review/Detail/1234567890"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Detail/{id}"
	And Status should be Bad Request

Scenario: #92615 View Review Details (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Detail-id"
	And I see the text "GET api/Listing/Review/Detail/{id}" in the page
	When I press test API button
	And I send the url "api/Listing/Review/Detail/1"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Detail/{id}"
	And Status should be Unauthorized

Scenario: #73748 update membership
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-39fc882e5c70 | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be OK

Scenario: #73748 update membership (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-qwertyuisdfg | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be Bad Request

Scenario: #73748 update membership (user not loggin)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I press test API button
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-39fc882e5c70 | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be Unauthorized

Scenario: #73743 send school verification by admin 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School"
	And I see the text "POST api/Verification/School" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input the user data for school verification
	| userId                               | name             | email                 | verSchoolName | verSchoolWebsite                      | verSchoolAddress | verSchoolPhone | verContactPerson | verContactEmail                | verContactPhone | StandardVerification | Message |
	| 077e3c93-a17d-47a2-b1ad-6af4f2c2866f | Bambang Soekamti | poer91@mailinator.com | High School   | http://sman1bdg.sch.id/html/index.php | bandung          | 0987654321     | test             | smacontactemail@mailinator.com | 0987654321      | true                 | test    |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Verification/School"
	And Status should be OK

Scenario: #93646 check review for me API
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-ForMe-userId_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I input user Id in review for me "9c9ef7d4-3b6d-4aff-9a00-9ab8c11bae44" 
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/ForMe/{userId}?Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And "BookingEndDate" should be appear in result

Scenario: #93602 check get membership detail
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-Detail_UserId_FilterDateStart_FilterDateEnd_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Memberships/Detail?UserId=35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #93602 check get membership detail (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-Detail_UserId_FilterDateStart_FilterDateEnd_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Memberships/Detail?UserId=35de925a-5a29-4fed-9a07-qwertyusdfghgfdytr"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Bad Request

Scenario: #93602 check get membership detail (login as user)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-Detail_UserId_FilterDateStart_FilterDateEnd_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username  | password |
	| anggraeni | password |
	And I send the url "api/Memberships/Detail?UserId=35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #93602 check get membership detail (not login)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-Detail_UserId_FilterDateStart_FilterDateEnd_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I press test API button
	And I send the url "api/Memberships/Detail?UserId=35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/Detail?UserId={UserId}&FilterDateStart={FilterDateStart}&FilterDateEnd={FilterDateEnd}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be Unauthorized

Scenario: #93602 update membership
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-39fc882e5c70 | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be OK

Scenario: #93602 update membership (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-qwertyuisdfg | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be Bad Request

Scenario: #93602 update membership (user not loggin)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Update"
	And I see the text "POST api/Memberships/Update" in the page
	When I press test API button
	And I input membership data update 
	| active | userId                               | inactiveReason |
	| false  | 1ad7552f-3960-475f-b625-39fc882e5c70 | test           |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Memberships/Update"
	And Status should be Unauthorized

Scenario: #93579 Search and View Review
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Listing/Review/Summary/35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #93579 Search and View Review (userid not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Listing/Review/Summary/35de925a-5a29-4fed-9a07-qqqqqqqqqqqqqqqqqqqq"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be Bad Request

Scenario: #93579 Search and View Review (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I press test API button
	And I send the url "api/Listing/Review/Summary/35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be Unauthorized

Scenario: #93579 Search and View Review (login as user not admin)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	| username  | password |
	| kimwoobin | password |
	And I send the url "api/Listing/Review/Summary/35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be Unauthorized

Scenario: #94899 check News modification
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Listing-Review-Summary-userId"
	And I see the text "GET api/Listing/Review/Summary/{userId}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Listing/Review/Summary/35de925a-5a29-4fed-9a07-ff4f128a0beb"
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Listing/Review/Summary/{userId}"
	And Status should be OK

Scenario: #91014 check contact us 
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-ContactUs-Submit"
	And I see the text "POST api/ContactUs/Submit" in the page
	When I press test API button
	And I input contact us data
	| email             | firstName | lastName  | message         | Category             | ImageUrl                             |
	| kan@voxteneo.asia | kory      | anggraeni | test contact us | Report an IT Problem | C4EC701B-94A9-4C7D-ADA9-FFE3F5390A6E |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/ContactUs/Submit"
	And Status should be OK

Scenario: #95712 check generate list pagination
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-AccountingInformation_DateFrom_DateTo_Offset_Limit_OrderBy_OrderDirection"
	And I see the text "GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I send the url "api/Memberships/AccountingInformation?DateFrom=&DateTo=&Offset=1&Limit=5&OrderBy=&OrderDirection="
	And I click send button
	Then The result pop-up should be opened "Response for GET api/Memberships/AccountingInformation?DateFrom={DateFrom}&DateTo={DateTo}&Offset={Offset}&Limit={Limit}&OrderBy={OrderBy}&OrderDirection={OrderDirection}"
	And Status should be OK
	And the result shouldn't be empty

Scenario: #90665 check paypal invoice
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I add header with token
	| username   | password |
	| songhyekyo | password |
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 2      | 8ad45dcd-7e12-464b-87f6-ee323f2dbcb7 | 07179911E61468130 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be OK

Scenario: #90665 check paypal invoice (login as admin)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I add header with token
	| username         | password      |
	| EHSAdministrator | pass@word2016 |
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 2      | 8ad45dcd-7e12-464b-87f6-ee323f2dbcb7 | 07179911E61468130 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Unauthorized

Scenario: #90665 check paypal invoice (plan id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I add header with token
	| username   | password |
	| songhyekyo | password |
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 0      | 8ad45dcd-7e12-464b-87f6-ee323f2dbcb7 | 07179911E61468130 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Bad Request

Scenario: #90665 check paypal invoice (user id not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I add header with token
	| username   | password |
	| songhyekyo | password |
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 2      | wertyuiowertyuuytreertytrewertytrewe | 07179911E61468130 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Bad Request

Scenario: #90665 check paypal invoice (transaction id is not exist)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I add header with token
	| username   | password |
	| songhyekyo | password |
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 2      | 8ad45dcd-7e12-464b-87f6-ee323f2dbcb7 | 87t876tyutytuytyu |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Bad Request

Scenario: #90665 check paypal invoice (user not logged)
	Given I am on API page "http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Payment-Paypal"
	And I see the text "POST api/Payment/Paypal" in the page
	When I press test API button
	And I input paypal payment data
	| PlanId | UserId                               | TransactionId     |
	| 2      | 8ad45dcd-7e12-464b-87f6-ee323f2dbcb7 | 07179911E61468130 |
	And I click send button
	Then The result pop-up should be opened "Response for POST api/Payment/Paypal"
	And Status should be Unauthorized

Scenario: testtesttest
	Given test "smacontactemail@mailinator.com"