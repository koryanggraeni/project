Feature: testEHSt1

@mytag
Scenario: Verify the menu content in header
	Given I navigate to the page "http://ehs.website-test.t1.voxteneo.com/#/"
	When I on header content
	Then I should see folowing menu:
	| menu         |
	| Home         |
	| Search Homes |
	| How It Works |
	| Help         |
	| Sign In      |
	| Sign Up      |
	And I should see the button "Sign Up"

Scenario: Verify missing field in profile page
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to profile page 
	When the profie page is loaded 
	Then I should see the missing field
	| title                 | field                 |
	| Street address line 2 | UserAddressAddressTwo |
	| House Number          | UserAddressHouseNo    |

Scenario: Verify failed change password(old password incorrect) 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to change password page 
	When the change password page is loaded 
	And I change the password
	| oldPassword  | newPassword | confirmationPassword |
	| lucubanget1 | utari123    | utari123             |
	Then I should see the pop-up message "Invalid old password"

Scenario: Verify failed change password(input less than 8 character)
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to change password page 
	When the change password page is loaded 
	And I change the password
	| oldPassword | newPassword | confirmationPassword |
	| lucubanget | uta         | uta                  |
	Then I should see new password error message "Password cannot be less than 8 characters"

Scenario: Verify failed change password(confrim password not match)
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to change password page 
	When the change password page is loaded 
	And I change the password
	| oldPassword | newPassword | confirmationPassword |
	| lucubanget | utari123    | utari1234            |
	Then I should see confrim password error message "Confirm Password must be same with Password" 

Scenario: Verify failed change password(password is empty)
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to change password page 
	When the change password page is loaded 
	And I change the password
	| oldPassword | newPassword | confirmationPassword |
	|             |             |                      |
	Then I should see old password error message "Old Password cannot be empty."
	And I should see new password error message "Password cannot be empty."
	And I should see confrim password error message "Confirm Password cannot be empty."

Scenario: Verify success change password 
	Given I login to the website
	| username    | password    |
	| lucubanget | utari123 |
	And I go to change password page 
	When the change password page is loaded 
	And I change the password
	| oldPassword | newPassword | confirmationPassword |
	| utari123 | lucubanget    | lucubanget             |
	Then I should see the pop-up message "Your password is successfully changed."

Scenario: Verify delete account 
	Given I login to the website
	| username | password |
	| testtest | testtest |
	And I go to profile page
	When the profie page is loaded
	And I click delete account button 
	And I input the password "testtest"
	Then I should see the pop-up message "Your account has been deleted from the list of active users"

Scenario: Verify content in profile page
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to profile page 
	When the profie page is loaded 
	Then I should see all fileds that profile page should have 

Scenario: Verify edit user profile
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to profile page 
	When the profie page is loaded 
	And I change the user profile
	| firstName | lastName | phoneNumber | mobileNumber | profileDescription | email                      | searchLocation | addressOne | addressTwo | houseNumber | country   | state     | city    | zipCode |
	| lucu     | banget   | 0987654321  | 0987654321   | test desccription  | lucubanget@mailinator.com | Indonesia      | Bandung    | test       | 22          | Indonesia | Indonesia | Bandung | 12345   |
	Then I click save
	And I should see the pop-up message "Your profile is updated."

Scenario: #75385 Verify delete account pop-up
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to profile page 
	When the profie page is loaded 
	And I click delete account button
	Then I should see the text on the pop-up
	| id | text                                                     |
	| 1  | Your account will deleted from the list of active users. |
	| 2  | Please enter your password to delete your account:       |
	And I should see the field password, cancel button and delete account button

Scenario: #73724 Verify Design Detail testimonial
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/index.html"
	When I click "read more" link 
	Then I should see "Testimonial Details"label of pop-up detail 

Scenario: #75400 Verify Design dialog box small
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/dialog-box.html"
	When I click "small" link 
	Then I should see "Small Modal Title"label of pop-up detail 
	And I should see the cancel button "small" 
	And I should see the yes button "small" 
	And I  should see the close button "small" 

Scenario: #75400 Verify Design dialog box medium
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/dialog-box.html"
	When I click "medium" link 
	Then I should see "Medium Modal Title"label of pop-up detail 
	And I should see the cancel button "medium" 
	And I should see the yes button "medium" 
	And I  should see the close button "medium" 

Scenario: #75400 Verify Design dialog box large
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/dialog-box.html"
	When I click "large" link 
	Then I should see "Large Modal Title"label of pop-up detail 
	And I should see the cancel button "large" 
	And I should see the yes button "large" 
	And I  should see the close button "large" 

Scenario: #78979 check save profile description in profile page 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When edit the profile
	| firstName | lastName | phoneNumber | mobileNumber | profileDescription | email                      | searchLocation | addressOne | addressTwo | houseNumber | country   | state     | city    | zipCode |
	| utari     | cantik   | 0987654321  | 0987654321   | test desccription  | lucubanget@mailinator.com | Indonesia      | Bandung    | test       | 22          | Indonesia | Indonesia | Bandung | 12345   |
	Then I go to profile page
	And I should see "test desccription" in profile description field

Scenario: #72846 check view listing detail 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open detail listing page 
	Then I should see the content 
	| no | content                                                          |
	| 1  | Is your home available to share?                                 |
	| 2  | Listing Title *                                                  |
	| 4  | Set my personal address as my listing address                    |
	| 5  | Country *                                                        |
	| 6  | State *                                                          |
	| 7  | City *                                                           |
	| 8  | Zip Code *                                                       |
	| 9  | Street address line 1 *                                          |
	| 11 | Listing Description *                                            |
	| 12 | Number of people that can be accomodated                         |
	| 13 | Number of bedrooms                                               |
	| 14 | Personal Car                                                     |  
	| 15 | Public Transportation                                            | 
	| 16 | Pets                                                             |  
	| 17 | Smoking                                                          |           

Scenario: #72783 check public profile 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open public profile with uername "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	Then I should see user information 
	And I should see user listing information 
	And I should see user review and recommendation

Scenario: #72783 check summary of public profile 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open public profile with uername "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	Then I should see summary data of listing user

Scenario: #72783 check review for host of public profile 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open public profile with uername "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click "Reviews for Host" tab
	Then I should see reviews of host data of listing user

Scenario: #72783 check review from host of public profile 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open public profile with uername "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click "Reviews from Host" tab
	Then I should see reviews from host data of listing user

Scenario: #72783 check recommendation of public profile 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When open public profile with uername "71a9424f-e9fb-4563-b4d4-80f9f88d7e2e"
	And I click "Recommendations" tab
	Then I should see recommendations data of listing user

Scenario: #72838 check public profile when click preview in profile page 
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to profile page
	When I click preview button 
	Then I should see user information 
	And I should see user listing information 
	And I should see user review and recommendation

Scenario: #74356 check delete listing photo
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to listing page 
	And I upoad the image
	When I click delete image icon 
	And I should see delete image verification pop-up 
	And I click yes button on delete listing pop-up 
	Then I should see pop-up notification "Delete Listing Photo successfully!"

 Scenario: #74355 check upload listing photo
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to listing page 
	When I upload image 
	Then I should see the success message upload image 

Scenario: #77274 check about us page content 
	Given I navigate to the page "http://ehs.website-test.t1.voxteneo.com"
	When I click about us button 
	And about us page should be loaded
	Then I should see the text 
	| line | title                         | text                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
	| 1    | What is Educators Home Share? | EHS is an online platform connecting educators worldwide. It enables guest educators to book unique home stays from local and international educator hosts, saving them money and giving them a chance to have a different kind of travel experience. Host educators enjoy peace of mind during their own travels knowing someone is caring for their home. Catering to the travel needs of educators, EHS aims to have every country of the world listed as a destination on its platform.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
	| 2    | Our Mission                   | Our Mission\nThe mission of EHS is to provide a high quality platform for the sharing of homes amongst educators worldwide.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
	| 3    | Our Story                     | Our Story\nLet’s face it - educators are professionals who enjoy a lot of holidays. It’s one thing to save for and enjoy a one or two-week holiday per year. It’s a whole different thing to plan and enjoy a 6 to 8 week holiday on top of a few other one to two-week breaks per year without going broke! Cost becomes a big consideration.\nInternational educators are behind the Educators Home Share project. We feel that traditional home exchange programs do not cater well to the needs of educators. The whole world seems to be on holidays when you are, so competition for homes in general home exchange sites is very intense. With EHS, educators no longer compete with the entire world to secure that perfect holiday spot! EHS is being created specifically for educators worldwide.\n Educators Home Share is the merging of international educator experience with the IT expertise of Vox Teneo (www.voxteneo.com), a global software development company. We hope that our platform will allow you to create unforgettable holiday memories and save a lot in the process! |

Scenario: #77288 check how it works content 
	Given I navigate to the page "http://ehs.website-test.t1.voxteneo.com"
	When I click how it works button 
	And how it works page should be loaded
	Then I should see the text 
	| line | title   | text                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
	| 4    |         | EHS has been created specifically for active, former and retired educators worldwide. We encourage sharing rather than exchanging. You don’t have to have a home to share to participate and you are not restricted to exchanging with someone who wants to come to your home.                                                                                                                                                                                                                             |
	| 5    | Sign up | After completing the Sign Up form, you will be directed to a payment gateway. A one-year membership costs $89. If you have a voucher, you will be able to claim it on this page. Email and school verifications will follow. This is to ensure integrity and trust within the EHS Community. Once your school verification has been successful, you will be able to access your dashboard to finish entering your personal details as well as your home listing details (if you choose to list your home). |
	| 6    | Connect | Your membership entitles you to access and search our database, experience unlimited free home shares, send and receive inquires, enjoy secure messaging and alerts between hosts and guests, and write and receive personal reviews and recommendations.                                                                                                                                                                                                                                                  |
	| 7    | Share   | This is when you get to enjoy your travel and sharing experience.  Once you have created your unforgettable memories, both the guest and the host educator have the opportunity to write a review / response about their experience.  Reviews and responses are important as they keep guests and hosts accountable.                                                                                                                                                                                       |

Scenario: #77296 check verification page content 
	Given I login to the website
	| username   | password   |
	| lucubanget | lucubanget |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/verifications"
	And verification page should be loaded
	Then I should see the verification content page  
	| line | title                 | text                                                                                                                                                                                                                                                   | button                    |
	| 1    | Email Verification    | We carry out email verifications in order to ensure that you are the authentic owner of this email account.                                                                                                                                            | Resend Email Verification |
	| 2    | Facebook Verification | This is an optional verification that may give more credibility to the information in your EHS personal profile.                                                                                                                                       | Connect to Facebook       |
	| 3    | School Verification   | We carry out school verifications to verify that you are / were an educator. Depending on whether you are an active, former or retired teacher, you will need to complete this process differently. Instructions are given in the verification window. | Verify School             |

Scenario: #77278 check contact us page content 
	Given I navigate to the page "http://ehs.website-test.t1.voxteneo.com"
	When I click contact us button 
	And contact us page should be loaded
	Then I should see the contact us content page 
	
Scenario: #77186 check sing-up email verification 
	Given I sign up to the website 
	| firstName     | lastName     | username     | email                       | password     |
	| testfirstname | testLastname | testusername | testemail123@mailinator.com | testpassword |
	When I open the user email "testemail123@mailinator.com"
	Then email verification content should be OK 
	| title              | text                                                                                                                                                                                                          |
	| EMAIL VERIFICATION | EMAIL VERIFICATION Hello testusername. \n\n Thank you for joining the Educators Home Share community. Please verify your email address by clicking on this link: Link \n\n Thank you, \n \n\n Regards the EHS Team. |

Scenario: #77292 check sign-up content
	Given I am on sign-up page 
	When sign-up page loaded
	Then I should see the text content in sign-up page
	| title                                                                                        | text                                                                                                                                                                                                                                                                                 |
	| Sign up to experience a more affordable and authentic way of traveling during your holidays. | At Educators Home Share, we connect you with others who are looking to experience low cost holidays. Whether you are retired or currently teaching, EHS provides educators with the opportunity to travel to unique places, experience life as a local and discover new friendships. |

Scenario: #80774 check cookies disclimer
	Given I open the browser	
	When I go to homepage
	Then I should see notification about cookies

Scenario: #80774 check cookies disclimer url
	Given I open the browser	
	When I go to homepage
	And I click "here" link
	Then I should at "http://www.aboutcookies.org/Default.aspx?page=1"

Scenario: #77282 check homepage content 
	Given I open the browser
	When I go to homepage
	And I close the cookies disclimer
	Then I should see the text to be included in home page 
	| text                                                                                                                                |
	| Experience the difference between a home share and a home exchange.                                                                 |
	| Find out how we saved more than $5,000 (USD) during our last summer holiday!                                                        |
	| BETA LAUNCH                                                                                                                         |
	| How It Works?                                                                                                                       |
	| Our site caters exclusively to educators worldwide. You can sign up whether you have a home to share or not. It’s quick and easy!   |
	| Connect with host members to secure the perfect home share for your next travel adventure. Someone is waiting to hear from you!     |
	| Not only do you get to save on accommodation costs, you also get to experience a more comfortable stay with a local flair. Perfect! |
	| Launched October 2016, our community continues to grow daily!                                                                       |
	| Adventure travel, a family holiday or simply to save on travel costs, there are many reasons why educators are talking about EHS!   |
	| How we saved more than $5,000 (USD) during our last summer holiday!                                                                 |
	| Learn more                                                                                                                          |
	| Read more                                                                                                                           |
	| Terms of Service                                                                                                                    |
	And I click the banner to verify the page that directed 

Scenario: #75013 check share listing
	Given I login to the website
	| username   | password   |
	| lucubanget | lucubanget |
	And I go to listing page
	When I click share listing radio button 
	Then I should see avalability section 

Scenario: #75013 check unshare listing
	Given I login to the website
	| username   | password   |
	| lucubanget | lucubanget |
	And I go to listing page
	When I click unshare listing radio button 
	Then I shouldn't see avalability section 

Scenario: #81515 check delete listing photo
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	And I go to listing page 
	And I upoad the image
	When I click delete image icon 
	And I should see delete image verification pop-up 
	And I click yes button on delete listing pop-up 
	Then I should see pop-up notification tOne "Image deleted successfully"

Scenario: #77659 check the username for all page when user has logged
	Given I login to the website
	| username    | password    |
	| lucubanget | lucubanget |
	When home page is loaded
	Then I should see the username in the header "utari"

Scenario: #72843 check email verification 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I go to verification page 
	When I click Send Email Verification 
	And I should see the success message 
	And I open the user email "kan@mailinator.com"
	Then the email verification content should be Ok

Scenario: #72845 check school verification 
	Given I login to the website
	| username   | password |
	| iannone | password |
	And I close the cookies
	And I go to school verification page 
	And I input verification school data 
	| verSchoolName | verSchoolWebsite                      | verSchoolAddress| verSchoolContact | verContactPerson | verContactPersonNumber | verContactEmail              |
	| High School   | http://sman1bdg.sch.id/html/index.php | bandung         | bandung          | test             | 0987654321             | koryanggraeni@rocketmail.com |
	When I press "Send Verification Request" button 
	Then I should see message "Your school verification request has been successfully sent. You will be able to access your Dashboard after your school has replied the verification."

Scenario: #75235 check school verification 
	Given I login to the website
	| username   | password |
	| schumacher | password |
	And I close the cookies
	When I go to school verification page 
	Then I should see the correct field on the page 

Scenario: #80366 check verification email design 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-school-verification-1.html"
	Then I should see the correct content email "Educator Status Verification"

Scenario: #79127 check success verification email design 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-school-verification-2.html"
	Then I should see the correct content email "Successful School Verification"

Scenario: #79127 check unsuccessful verification email design 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-school-verification-3.html"
	Then I should see the correct content email "Unsuccessful School Verification"

Scenario: #73303 replay school verification 
	Given I open the email page 
	When I open the email "koryanggraeni@rocketmail.com" and 0
	And I click verification 
	Then I should see verify message "Thank you for your help in this verification process." 
	And I should see the school verification email

Scenario: #73303 replay school verification (school already verified)
	Given I open the email page 
	When I open the email "koryanggraeni@rocketmail.com" and 1
	And I click verification 
	Then I should see verify message "You have verified this user." 

Scenario: #75202 check design Apply to Home with Not Enough Membership
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/pop-up-not-enough-membership.html"
	When I click FE "Apply Now" button
	Then I should see the alert message

Scenario: #75197 check design Apply to Home with Active Membership
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/pop-up-apply-to-home-with-active-membership.html"
	When I click FE "apply now" button
	Then I should see the content on the pop-up

Scenario: #78978 check verification email design 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-booking-request.html"
	Then I should see the correct content email "Booking Request Accepted"

Scenario: #75556 check design membership detail
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-user-membership.html"
	Then I should see the content of membership detail page 

Scenario: #73979 check design contact me pop-up
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-contact-me-pop-up.html"
	When I click FE "Contact Me" button
	Then I should see the content on the contact me pop-up

Scenario: #77680 check design admin user list
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-user-list.html"
	Then I should see the content of admin user list page

Scenario: #80368 check email design for cancelling booking by guest member
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking.html"
	Then I should see the eamail content cancelling booking by guest member

Scenario: #80368 check email design for cancelling booking by host member
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking-2.html"
	Then I should see the email content cancelling booking by host member

Scenario: #80369 check recommendation email template
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-recommendation.html"
	Then I should see the email of recommendation 

Scenario: #80370 check invite now email template 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-invite-now.html"
	Then I should see the email of invite now

Scenario: #80371 check voucher email template
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-template-vouchers.html"
	Then I should see the email of voucher

Scenario: #80372 check welcome email template
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-welcome.html"
	Then I should see the email of welcome

Scenario: #80376 check email incomple profile
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-incomplete-profile.html"
	Then I should see the email of incomplete profile

Scenario: #80377 check email delete account
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-delete-account.html"
	Then I should see the email of delete account

Scenario: #80378 check email account inactive for 3 months
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-account-3-month-inactive.html"
	Then I should see the email of account inactive for 3 months

Scenario: #80380 check email reminder to riview for guest
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-reminder-to-review.html"
	Then I should see the email of reminder to riview for guest

Scenario: #80380 check email reminder to riview for host
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-reminder-to-review-2.html"
	Then I should see the email of reminder to riview for host

Scenario: #72778 check search home as guest by location
	Given I am on search homes page
	And I input search by location 
	| destination | DateFrom    | DateTo      | Person |
	| bandung     | 19-Sep-2016 | 19-Sep-2016 | 3      |
	When I click search
	Then I should see  the result of homes search 
	| address            | userListing        |
	| Bandung, Indonesia | Whisnu Sucitanuary |

Scenario: #72778 check search home as guest by username
	Given I am on search homes page
	And I click username tab
	And I input username "sucitanuary"
	When I click search
	Then I should see  the result of homes search 
	| address            | userListing    |
	| Bandung, Indonesia | Whisnu Listing |  

Scenario: #72778 check search home as guest by length of stay 
	Given I am on search homes page
	When I click search 
	And I click radio button for length of stay
	And I select 10 days
	Then I should see the listing that have length of stay is same or more than 10 days

Scenario: #72778 check search home as guest by bed room
	Given I am on search homes page
	When I click search 
	And I input number of bed room "2"
	Then I should see the listing that have "2" bed room
	
Scenario: #72778 check search home as guest by personal car
	Given I am on search homes page
	When I click search 
	And I input personal car feature "Is available for use"
	Then I should see the listing that have personal car is available for use
	
Scenario: #72778 check search home as guest by public transportation
	Given I am on search homes page
	When I click search 
	And I input public transportation feature "Available within a 15-minute walk"
	Then I should see the listing that have public transportation Available within a 15-minute walk

Scenario: #72778 check search home as guest by pet
	Given I am on search homes page
	When I click search 
	And I input pet feature "Caring for pets required"
	Then I should see the listing that have Caring for pets required

Scenario: #72778 check search home as guest by smoking
	Given I am on search homes page
	When I click search 
	And I input smoking feature "Not allowed inside the house"
	Then I should see the listing that Not allowed inside the house

Scenario: #80398 check booking accepted email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-booking-accepted.html"
	Then I should see the email of booking accepted

Scenario: #80397 check booking request email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-booking-request.html"
	Then I should see the email of booking request

Scenario: #80396 check cancel booking email by guest 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking.html"
	Then I should see the eamail content cancelling booking by guest member

Scenario: #80396 check cancel booking email by host member
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking-2.html"
	Then I should see the email content cancelling booking by host member

Scenario: #80395 check cancel my home email by guest 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking.html"
	Then I should see the eamail content cancelling booking by guest member

Scenario: #80395 check cancel my home email by host member
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-cancelling-booking-2.html"
	Then I should see the email content cancelling booking by host member

Scenario: #80392 check declined booking
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-booking-declined.html"
	Then I should see the email content declined booking 

Scenario: #80391 check one week before a home stay email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-remider-7days-before-homestay.html"
	Then I should see the email content one week before a home stay

Scenario: #80389 check message inbox email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-messages-inbox.html"
	Then I should see the email content message inbox

Scenario: #80386 check membership expiry 14 days email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-membership-expiry-14-day.html"
	Then I should see the email content membership expiry 14 days

Scenario: #80384 check weekly listing update email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-weekly-listing-updates.html"
	Then I should see the email content weekly listing update

Scenario: #80383 check response request for host email (user has completed a review)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-response-request-for-host1.html"
	Then I should see the email content response request for host (user has completed a review)

Scenario: #80383 check response request for host email (user doesn't write a review)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-response-request-for-host2.html"
	Then I should see the email content response request for host (user doesn't write a review)

Scenario: #80382 check response request for host email (user has completed a review)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-response-request-for-host1.html"
	Then I should see the email content response request for host (user has completed a review)

Scenario: #80382 check response request for host email (user doesn't write a review)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-response-request-for-host2.html"
	Then I should see the email content response request for host (user doesn't write a review)

Scenario: #80381 check email reminder to review for guest
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-reminder-to-review.html"
	Then I should see the email of reminder to riview for guest

Scenario: #80381 check email reminder to review for host
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-reminder-to-review-2.html"
	Then I should see the email of reminder to riview for host

Scenario: #82599 check filed inverification school
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/school-verification"
	Then I should see read-only field for firstname and lastname

Scenario: #80379 check email review request for guest
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/email-review-for-guest.html"
	Then I should see the email of review request for guest

Scenario: #80373 check email verification when sign-up
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/generic-email-template.html"
	Then I should see the email of verification when sign-up

Scenario: #80373 check email verification when change email
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/generic-email-template-2.html"
	Then I should see the email of verification when change email

Scenario: #81059 check confrim booking page 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	And I press "Accept" button
	Then I should see read-only for all fields on confrim booking

Scenario: #84521 check search result informative 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I click "Search Homes" link
	And I press list icon
	Then I should see informative result

Scenario: #85361 check photo credit page 
	Given I am on FE page "http://ehs.website-test.t1.voxteneo.com/#/photo-credits"
	Then all link should be correct
	| country                        | link                                                                                                                                                                                                      |
	| Afghanistan                    | https://commons.wikimedia.org/wiki/File:Afghanistan%27s_Grand_Canyon.jpg                                                                                                                                  |
	| Albania                        | https://commons.wikimedia.org/wiki/File:Kruja.jpg                                                                                                                                                         |
	| Algeria                        | https://commons.wikimedia.org/wiki/File:Meharis.jpg                                                                                                                                                       |
	| Andorra                        | https://commons.wikimedia.org/wiki/File:Estanys_de_Baiau_from_Port_de_Baiau.jpg                                                                                                                           |
	| Angola                         | https://commons.wikimedia.org/wiki/File:Kalandula_waterfalls_of_the_Lucala-River_in_Malange,_Angola.jpg                                                                                                   |
	| Antigua and Barbuda            | https://commons.wikimedia.org/wiki/File:Fort_Berkeley_(5915536801).jpg                                                                                                                                    |
	| Argentina                      | https://commons.wikimedia.org/wiki/File:Caminito_Farolito.jpg                                                                                                                                             |
	| Armenia                        | https://commons.wikimedia.org/wiki/File:Tatev_Monastery_from_a_distance.jpg                                                                                                                               |
	| Australia                      | https://commons.wikimedia.org/wiki/File:Uluru,_helicopter_view,_cropped.jpg                                                                                                                               |
	| Austria                        | https://commons.wikimedia.org/wiki/File:Fontaine_Opera_Vienne.jpg                                                                                                                                         |
	| Azerbaijan                     | https://commons.wikimedia.org/wiki/File:Azerbaijan-Tower-1.jpg                                                                                                                                            |
	| Bahamas                        | https://commons.wikimedia.org/wiki/File:The_Hermitage,_Cat_Island,_Bahamas.jpg                                                                                                                            |
	| Bahrain                        | https://commons.wikimedia.org/wiki/File:Isa_Bin_Ali_House.jpg                                                                                                                                             |
	| Bangladesh                     | https://commons.wikimedia.org/wiki/File:Bangladesh_Supreme_Court.jpg                                                                                                                                      |
	| Barbados                       | https://commons.wikimedia.org/wiki/File:A_beach,_Barbados_(6895201087).jpg                                                                                                                                |
	| Belarus                        | https://commons.wikimedia.org/wiki/File:Комплекс_Мирского_замка.jpg                                                                                                                                       |
	| Belgium                        | https://commons.wikimedia.org/wiki/File:Brussels_Great_Market_Square.jpg                                                                                                                                  |
	| Belize                         | https://commons.wikimedia.org/wiki/File:Coral_Reef,_Belize_2.jpg                                                                                                                                          |
	| Benin                          | https://commons.wikimedia.org/wiki/File:Coucher_de_soleil_Pendjari.jpg                                                                                                                                    |
	| Bhutan                         | https://commons.wikimedia.org/wiki/File:Tashigang_Dzong_111120.jpg                                                                                                                                        |
	| Bolivia                        | https://commons.wikimedia.org/wiki/File:Palacio_de_la_Prefectura_de_Chuquisaca_(Sucre_-_Bolivia).jpg                                                                                                      |
	| Bosnia and Herzegovina         | https://commons.wikimedia.org/wiki/File:Mostar_Old_Town_Panorama_2007.jpg                                                                                                                                 |
	| Botswana                       | https://commons.wikimedia.org/wiki/File:Kalahari_PICT0036.jpg                                                                                                                                             |
	| Brazil                         | https://commons.wikimedia.org/wiki/File:Ponte_estaiada_Octavio_Frias_-_Sao_Paulo.jpg                                                                                                                      |
	| Brunei                         | https://commons.wikimedia.org/wiki/File:Kuala_Belait_at_Night_(18623608099).jpg                                                                                                                           |
	| Bulgaria                       | https://commons.wikimedia.org/wiki/File:20100213_Zlatograd_Bulgaria_3.jpg                                                                                                                                 |
	| Burkina Faso                   | https://commons.wikimedia.org/wiki/File:Vendeuse_d%27arachides.jpg                                                                                                                                        |
	| Burundi                        | https://commons.wikimedia.org/wiki/File:Countryside_close_to_Gitega_(6908580277).jpg                                                                                                                      |
	| Cabo Verde                     | https://commons.wikimedia.org/wiki/File:Mount_fogo.jpg                                                                                                                                                    |
	| Cambodia                       | https://commons.wikimedia.org/wiki/File:2014-Cambodge_sony_(224).jpg                                                                                                                                      |
	| Cameroon                       | https://commons.wikimedia.org/wiki/File:Elephants_around_tree_in_Waza,_Cameroon.jpg                                                                                                                       |
	| Canada                         | https://commons.wikimedia.org/wiki/File:Moraine_Lake_17092005.jpg                                                                                                                                         |
	| Chad                           | https://commons.wikimedia.org/wiki/File:Saré_masa.jpg                                                                                                                                                     |
	| Chile                          | https://commons.wikimedia.org/wiki/File:Coyhaique10.jpg                                                                                                                                                   |
	| China                          | https://commons.wikimedia.org/wiki/File:20090529_Great_Wall_8185.jpg                                                                                                                                      |
	| Columbia                       | https://commons.wikimedia.org/wiki/File:Santuario_Nacional_de_Las_Lajas_02.jpg                                                                                                                            |
	| Comoros                        | https://commons.wikimedia.org/wiki/File:Comoros_coral_reef_(5975110268).jpg                                                                                                                               |
	| Congo                          | https://commons.wikimedia.org/wiki/File:Cathedral_of_Notre_Dame_de_l%27Assomption_in_Pointe-Noire_(20133584521).jpg                                                                                       |
	| Costa Rica                     | https://commons.wikimedia.org/wiki/File:CostaRica44_(8415726720).jpg                                                                                                                                      |
	| Cote D’Ivoire                  | https://commons.wikimedia.org/wiki/File:Bar_Chez_Christophe.jpg                                                                                                                                           |
	| Croatia                        | https://commons.wikimedia.org/wiki/File:Dubrovnik_june_2011..jpg                                                                                                                                          |
	| Cuba                           | https://commons.wikimedia.org/wiki/File:5_Caibarienmusee.jpg                                                                                                                                              |
	| Cyprus                         | https://commons.wikimedia.org/wiki/File:Saint_Nicholas_church_00582.jpg                                                                                                                                   |
	| Czech Republic                 | https://commons.wikimedia.org/wiki/File:Kašperské_Hory_od_Lišč%C3%ADho_vrchu.jpg                                                                                                                          |
	| Denmark                        | https://commons.wikimedia.org/wiki/File:Christiansborg_Slot_Copenhagen_2014_01.jpg                                                                                                                        |
	| Djibouti                       | https://commons.wikimedia.org/wiki/File:Guinni_Kôma.jpg                                                                                                                                                   |
	| Dominica                       | https://commons.wikimedia.org/wiki/File:Dominica_IMG_5270.jpg                                                                                                                                             |
	| Dominican Republic             | https://commons.wikimedia.org/wiki/File:Flickr_-_ronsaunders47_-_DOMINICAN_REPUBLIC._Desert_island..jpg                                                                                                   |
	| Ecuador                        | https://commons.wikimedia.org/wiki/File:Machala_-_parque_central_de_noche.jpg                                                                                                                             |
	| Egypt                          | https://commons.wikimedia.org/wiki/File:Abu_el-Haggag_R03.jpg                                                                                                                                             |
	| El Salvador                    | https://commons.wikimedia.org/wiki/File:Santa_Tecla_y_volcán_de_San_Salvador_(6803608805).jpg                                                                                                             |
	| Eritrea                        | https://commons.wikimedia.org/wiki/File:Road_to_Dekemhare_(8352533688).jpg                                                                                                                                |
	| Estonia                        | https://commons.wikimedia.org/wiki/File:Tallinna_Raekoda_11-06-2013.jpg                                                                                                                                   |
	| Ethiopia                       | https://commons.wikimedia.org/wiki/File:Abreha_and_Atsbeha_Church_-_Door.jpg                                                                                                                              |
	| Fiji                           | https://commons.wikimedia.org/wiki/File:Nukubati_Island,_Fiji_-_panoramio.jpg                                                                                                                             |
	| Finland                        | https://commons.wikimedia.org/wiki/File:Suurkirkko_Helsinki_maaliskuu_2002_IMG_0629.jpg                                                                                                                   |
	| France                         | https://commons.wikimedia.org/wiki/File:Strasbourg_Cathedral.jpg                                                                                                                                          |
	| Gabon                          | https://commons.wikimedia.org/wiki/File:La_lope.jpg                                                                                                                                                       |
	| Gambia                         | https://commons.wikimedia.org/wiki/File:At_the_stone_circles_in_Wassu_Gambia_are_many_heavy_stones_used.jpg                                                                                               |
	| Georgia                        | https://commons.wikimedia.org/wiki/File:Atenis_Sioni_view.jpg                                                                                                                                             |
	| Germany                        | https://commons.wikimedia.org/wiki/File:Munich_skyline.jpg                                                                                                                                                |
	| Ghana                          | https://commons.wikimedia.org/wiki/File:Elmina_Castle_-_Ghana.jpg                                                                                                                                         |
	| Greece                         | https://commons.wikimedia.org/wiki/File:Syros_emoupolis_agios_nikolaos_240707.jpg                                                                                                                         |
	| Grenada                        | https://commons.wikimedia.org/wiki/File:StGeorges.jpg                                                                                                                                                     |
	| Guatemala                      | https://commons.wikimedia.org/wiki/File:La_Merced_Church_Antigua_Guatemala_2.jpg                                                                                                                          |
	| Guinea                         | https://commons.wikimedia.org/wiki/File:20130613-DSC_9133_(9291669831)_(2).jpg                                                                                                                            |
	| Guyana                         | https://commons.wikimedia.org/wiki/File:Гайана.jpg                                                                                                                                                        |
	| Haiti                          | https://commons.wikimedia.org/wiki/File:Sail_Boats_Fishing_in_Haiti.tiff                                                                                                                                  |
	| Honduras                       | https://commons.wikimedia.org/wiki/File:Tegucigalpa_1983.jpg                                                                                                                                              |
	| Hungary                        | https://commons.wikimedia.org/wiki/File:Budapest_Parlament_Building.jpg                                                                                                                                   |
	| Iceland                        | https://commons.wikimedia.org/wiki/File:Grassodenhäuser.jpg                                                                                                                                               |
	| India                          | https://commons.wikimedia.org/wiki/File:Closer_View_to_Harminder_sahib_(_golden_temple_).jpg                                                                                                              |
	| Indonesia                      | https://commons.wikimedia.org/wiki/File:Raja_Ampat_Islands_-_journal.pbio.1001457.g001.png                                                                                                                |
	| Iran                           | https://commons.wikimedia.org/wiki/File:Arge_Bam_Arad_edit.jpg                                                                                                                                            |
	| Iraq                           | https://commons.wikimedia.org/wiki/File:20160105-Abraham_house_in_Ur_Iraq.jpg                                                                                                                             |
	| Ireland                        | https://commons.wikimedia.org/wiki/File:Carrigafoyle_Castle_Ireland.jpg                                                                                                                                   |
	| Israel                         | https://commons.wikimedia.org/wiki/File:Jerusalem_from_mt_olives.jpg                                                                                                                                      |
	| Italy                          | https://commons.wikimedia.org/wiki/File:Venedig_rialtobruecke.jpg                                                                                                                                         |
	| Jamacia                        | https://commons.wikimedia.org/wiki/File:DoctorsCaveBeach.jpeg                                                                                                                                             |
	| Japan                          | https://commons.wikimedia.org/wiki/File:Nagasaki_City_view_from_Hamahira01s3.jpg                                                                                                                          |
	| Jordan                         | https://commons.wikimedia.org/wiki/File:Abu_Darweesh_Mosque.jpg                                                                                                                                           |
	| Kazakhstan                     | https://commons.wikimedia.org/wiki/File:Orthodox_church,_Tekeli,_Timiryazeva_str.jpg                                                                                                                      |
	| Kenya                          | https://commons.wikimedia.org/wiki/File:Kenyan_village.jpg                                                                                                                                                |
	| Kiribati                       | https://commons.wikimedia.org/wiki/File:Kiribati_Adaptation_Program_(10707136963).jpg                                                                                                                     |
	| Kosovo                         | https://commons.wikimedia.org/wiki/File:Sana..jpg                                                                                                                                                         |
	| Kuwait                         | https://commons.wikimedia.org/wiki/File:Mosque_In_Kuwait.jpg                                                                                                                                              |
	| Kyrgyzstan                     | https://commons.wikimedia.org/wiki/File:Bizarre_Colors_and_Reflections_(3968054461).jpg                                                                                                                   |
	| Laos                           | https://commons.wikimedia.org/wiki/File:Le_«_temple_de_la_montagne_»Site_de_Vat_Phou_Champassak,_Laos_(2).jpg?fastcci_from=32419493&c1=32419493&d1=15&s=200&a=fqv                                         |
	| Latvia                         | https://commons.wikimedia.org/wiki/File:2006_09_14-17_RigaFortress054.jpg                                                                                                                                 |
	| Lebanon                        | https://commons.wikimedia.org/wiki/File:Al_Bennay_البنيه.jpg                                                                                                                                              |
	| Lesotho                        | https://commons.wikimedia.org/wiki/File:Lesotho_mountain_village_(5285775857).jpg                                                                                                                         |
	| Liberia                        | https://commons.wikimedia.org/wiki/File:Rubber_Tree_Plantation_in_Margibi_County,_Liberia.jpg                                                                                                             |
	| Libya                          | https://commons.wikimedia.org/wiki/File:Libya_4985_Tadrart_Acacus_Luca_Galuzzi_2007.jpg                                                                                                                   |
	| Liechtenstein                  | https://commons.wikimedia.org/wiki/File:Schlossvaduz.jpg                                                                                                                                                  |
	| Lithuania                      | https://commons.wikimedia.org/wiki/File:Vilnius_Modern_Skyline_At_Dusk,_Lithuania_-_Diliff.jpg                                                                                                            |
	| Luxembourg                     | https://commons.wikimedia.org/wiki/File:Luxembourg_Pfaffenthal_Alzette_Béinchen_01.jpg                                                                                                                    |
	| Macedonia                      | https://commons.wikimedia.org/wiki/File:Holy_trinity_church_Radoviš.jpg                                                                                                                                   |
	| Madagascar                     | https://commons.wikimedia.org/wiki/File:Madagascar_(26726619003).jpg                                                                                                                                      |
	| Malawi                         | https://commons.wikimedia.org/wiki/File:Malawi_acacia.jpg                                                                                                                                                 |
	| Malaysia                       | https://commons.wikimedia.org/wiki/File:Petronas_Towers_at_Night_-_from_the_base_upwards.jpg                                                                                                              |
	| Maldives                       | https://commons.wikimedia.org/wiki/File:Maldives_09934.jpg                                                                                                                                                |
	| Mali                           | https://commons.wikimedia.org/wiki/File:La_Dune_Rose.jpg                                                                                                                                                  |
	| Malta                          | https://commons.wikimedia.org/wiki/File:Għaxaq.jpg                                                                                                                                                        |
	| Marshall Islands               | https://commons.wikimedia.org/wiki/File:Marshall_Islands_(10700720174).jpg                                                                                                                                |
	| Mauritania                     | https://commons.wikimedia.org/wiki/File:Oudane_old_tower.jpg                                                                                                                                              |
	| Mauritius                      | https://commons.wikimedia.org/wiki/File:Port_Louis_Skyline.jpg                                                                                                                                            |
	| Mexico                         | https://commons.wikimedia.org/wiki/File:Imagebysafa2.jpg                                                                                                                                                  |
	| Moldova                        | https://commons.wikimedia.org/wiki/File:Podișul_Moldovei.jpg                                                                                                                                              |
	| Monaco                         | https://commons.wikimedia.org/wiki/File:PdMúnegu2.jpg                                                                                                                                                     |
	| Mongolia                       | https://commons.wikimedia.org/wiki/File:Mongolia_(22789239430).jpg                                                                                                                                        |
	| Montenegro                     | https://commons.wikimedia.org/wiki/File:Cathedral_Kotor.jpg                                                                                                                                               |
	| Morocco                        | https://commons.wikimedia.org/wiki/File:Vue_sur_la_médina.jpg                                                                                                                                             |
	| Mozambique                     | https://commons.wikimedia.org/wiki/File:Ponta_do_Ouro_in_the_morning.jpg                                                                                                                                  |
	| Myanmar (Burma)                | https://commons.wikimedia.org/wiki/File:Baganmyo.jpg                                                                                                                                                      |
	| Namibia                        | https://commons.wikimedia.org/wiki/File:Luderitz.jpg                                                                                                                                                      |
	| Nauru                          | https://commons.wikimedia.org/wiki/File:Framed_seascape_in_Nauru,_March_2013._Photo-_Angela_Spalding,_Australian_adviser_(12045933424).jpg                                                                |
	| Nepal                          | https://commons.wikimedia.org/wiki/File:Swayambhunath_in_Kathmandu_Valley,_Nepal.jpg                                                                                                                      |
	| Netherlands                    | https://commons.wikimedia.org/wiki/File:Koppelpoort_Amersfoort_Cropped.jpg                                                                                                                                |
	| New Zealand                    | https://commons.wikimedia.org/wiki/File:Auckland_Skyline_as_seen_from_Devonport_20100128_3.jpg                                                                                                            |
	| Nicaragua                      | https://commons.wikimedia.org/wiki/File:Cathedral_of_Granada_Nicaragua.jpg                                                                                                                                |
	| Niger                          | https://commons.wikimedia.org/wiki/File:Niamey_night.jpg                                                                                                                                                  |
	| North Korea                    | https://commons.wikimedia.org/wiki/File:0150_-_Nordkorea_2015_-_Sinhuangsan_-_Fluss_aus_Stein_(22778084140).jpg                                                                                           |
	| Norway                         | https://commons.wikimedia.org/wiki/File:Floen_in_Oldedalen,_2011_August.jpg                                                                                                                               |
	| Oman                           | https://commons.wikimedia.org/wiki/File:Entering_Oman_(8726793181).jpg                                                                                                                                    |
	| Pakistan                       | https://commons.wikimedia.org/wiki/File:Nankana_Sahib.jpg                                                                                                                                                 |
	| Palau                          | https://commons.wikimedia.org/wiki/File:Aerial_view_limestone_islands_palau1971.jpg                                                                                                                       |
	| Palestine                      | https://commons.wikimedia.org/wiki/File:1_كنيسة_بئر_يعقوب.jpg                                                                                                                                             |
	| Panama                         | https://commons.wikimedia.org/wiki/File:Panama_city_1.jpg                                                                                                                                                 |
	| Papua new Guinea               | https://commons.wikimedia.org/wiki/File:Ampo-St-Andrews-Lutheran-church.jpg                                                                                                                               |
	| Paraguay                       | https://commons.wikimedia.org/wiki/File:Asuncion_Palacio_Lopez.jpg                                                                                                                                        |
	| Peru                           | https://commons.wikimedia.org/wiki/File:80_-_Machu_Picchu_-_Juin_2009_-_edit.jpg                                                                                                                          |
	| Philipines:                    | https://commons.wikimedia.org/wiki/File:Taal_Volcano.jpg                                                                                                                                                  |
	| Poland                         | https://commons.wikimedia.org/wiki/File:Wrocław,_widok_na_rynek_z_Mostku_Czarownic.jpg                                                                                                                    |
	| Portugal                       | https://commons.wikimedia.org/wiki/File:Porto_Moniz_Madeira.jpg                                                                                                                                           |
	| Qatar                          | https://commons.wikimedia.org/wiki/File:Buildings_in_the_new_downtown_of_Doha_(12545060814).jpg                                                                                                           |
	| Romania                        | https://commons.wikimedia.org/wiki/File:Cazino_Constanta_1.jpg                                                                                                                                            |
	| Russia                         | https://commons.wikimedia.org/wiki/File:Kateřinský_palác_(25).jpg                                                                                                                                         |
	| St. Kitts and Nevis            | https://commons.wikimedia.org/wiki/File:Saint_Kitts_-_Brimstone_Hill_Fortress_04.jpg                                                                                                                      |
	| St. Vincent and The Grenadines | https://commons.wikimedia.org/wiki/File:PSV_Watersports_at_Petit_St._Vincent_Island_Resort_-_The_Grenadines,_St._Vincent,_Caribbean..tif                                                                  |
	| Samoa                          | https://commons.wikimedia.org/wiki/File:Lano_Beach_-_Savai%27i,_2007.jpg                                                                                                                                  |
	| San Marino                     | https://commons.wikimedia.org/wiki/File:San_Marino_statua_della_libertà.jpg                                                                                                                               |
	| Sao Tome and Principe          | https://commons.wikimedia.org/wiki/File:São_Tomé_(4238869802).jpg                                                                                                                                         |
	| Saudi Arabia                   | https://commons.wikimedia.org/wiki/File:Dhee_ayn_village_in_Hejaz.jpg                                                                                                                                     |
	| Senegal                        | https://commons.wikimedia.org/wiki/File:Pointe_des_Almadies_-_Senegal.jpg                                                                                                                                 |
	| Serbia                         | https://commons.wikimedia.org/wiki/File:Prizren_004.jpg                                                                                                                                                   |
	| Seychelles                     | https://commons.wikimedia.org/wiki/File:Anse_Source_d%27Argent_2-La_Digue.jpg                                                                                                                             |
	| Singapore                      | https://commons.wikimedia.org/wiki/File:The_Fullerton_Hotel_Singapore_and_the_Central_Business_District,_Singapore_-_20110426.jpg                                                                         |
	| Slovakia                       | https://commons.wikimedia.org/wiki/File:Trencin_hdr_001.jpg                                                                                                                                               |
	| Slovenia                       | https://commons.wikimedia.org/wiki/File:Novo_mesto_Breg_2.jpg                                                                                                                                             |
	| Solomon Islands                | https://commons.wikimedia.org/wiki/File:Bilums_(Traditional_bags_from_PNG)_hang_for_sale_from_a_tree_in_Honiara._Front_of_image_is_a_bag_that_reads_‘Solomon_Islands’_with_a_price_tag._(10677379183).jpg |
	| South Africa                   | https://commons.wikimedia.org/wiki/File:Panthera_leo_yawn_(Kgalagadi,_2012).jpg                                                                                                                           |
	| South Korea                    | https://commons.wikimedia.org/wiki/File:Korea-Hongdo_Island-02.jpg                                                                                                                                        |
	| Spain                          | https://commons.wikimedia.org/wiki/File:CATEDRAL_DE_SANTIAGO.jpg                                                                                                                                          |
	| Sri Lanka                      | https://commons.wikimedia.org/wiki/File:Stick_fishermen_of_Sri_Lanka.jpg                                                                                                                                  |
	| Sudan                          | https://commons.wikimedia.org/wiki/File:A_set_of_traditional_wat_jugs_at_a_rest_stop_between_Khartoum_and_Karima,_Sudan.jpg                                                                               |
	| Suriname                       | https://commons.wikimedia.org/wiki/File:Presidential_Palace_-_Paramaribo.jpg                                                                                                                              |
	| Swaziland                      | https://commons.wikimedia.org/wiki/File:MBAGoup6Hut.png                                                                                                                                                   |
	| Sweden                         | https://commons.wikimedia.org/wiki/File:Vaxholmsleden_February_2013_02_(crop).jpg                                                                                                                         |
	| Switzerland                    | https://commons.wikimedia.org/wiki/File:Geneve_2005_001_Ork.ch.jpg                                                                                                                                        |
	| Taiwan                         | https://commons.wikimedia.org/wiki/File:Cijin_District_view_from_Mt_QiHou.jpg                                                                                                                             |
	| Tajikistan                     | https://commons.wikimedia.org/wiki/File:Tajikistan_Fan-Mountains_-_landscape_02.jpg                                                                                                                       |
	| Tanzania                       | https://commons.wikimedia.org/wiki/File:Sansibar_Dhau1.jpg                                                                                                                                                |
	| Thailand                       | https://commons.wikimedia.org/wiki/File:Intanon_03.jpg                                                                                                                                                    |
	| Togo                           | https://commons.wikimedia.org/wiki/File:Atakpame_countryside.jpg                                                                                                                                          |
	| Trinidad and Tobago            | https://commons.wikimedia.org/wiki/File:Trinidad_national_museum_2006-23-02.jpg                                                                                                                           |
	| Tunisia                        | https://commons.wikimedia.org/wiki/File:Sidi_bou_saïd_,Tunisia.jpg                                                                                                                                        |
	| Turkey                         | https://commons.wikimedia.org/wiki/File:Exterior_of_Sultan_Ahmed_I_Mosque_in_Istanbul,_Turkey_002.jpg                                                                                                     |
	| Turkmenistan                   | https://commons.wikimedia.org/wiki/File:Azadi_Mosque_in_Ashgabat.jpg                                                                                                                                      |
	| Tuvalu                         | https://commons.wikimedia.org/wiki/File:Tuvalu_Funafuti_atoll_beach.jpg                                                                                                                                   |
	| Uganda                         | https://commons.wikimedia.org/wiki/File:Kampala_Kasubi_Tombs.jpg                                                                                                                                          |
	| Ukraine                        | https://commons.wikimedia.org/wiki/File:Троїцький_монастир.jpg                                                                                                                                            |
	| United Arab Emirates           | https://commons.wikimedia.org/wiki/File:Desert_near_Al_Ain.jpg                                                                                                                                            |
	| United Kingdom                 | https://commons.wikimedia.org/wiki/File:Tower_bridge_London_Twilight_-_November_2006.jpg                                                                                                                  |
	| USA                            | https://commons.wikimedia.org/wiki/File:Monument_Valley_02.jpg                                                                                                                                            |
	| Uruguay                        | https://commons.wikimedia.org/wiki/File:Colonia_del_Sacramento4_-_Uruguay.jpg                                                                                                                             |
	| Uzbekistan                     | https://commons.wikimedia.org/wiki/File:Ayaz_Khala,_Khorezm_(4933877963).jpg                                                                                                                              |
	| Vanuatu                        | https://commons.wikimedia.org/wiki/File:Central_Port_Vila,_Vanuatu,_29_Nov._2006_-_Flickr_-_PhillipC.jpg                                                                                                  |
	| Venezuela                      | https://commons.wikimedia.org/wiki/File:Vista_PlazaVenezuela.jpg                                                                                                                                          |
	| Vietnam                        | https://commons.wikimedia.org/wiki/File:HALONG_BAY.jpg                                                                                                                                                    |
	| Yemen                          | https://commons.wikimedia.org/wiki/File:Egyptian_vulture_(6407201415).jpg                                                                                                                                 |
	| Zambia                         | https://commons.wikimedia.org/wiki/File:Victoria_falls,_zambia.jpg                                                                                                                                        |
	| Zimbabwe                       | https://commons.wikimedia.org/wiki/File:Zimbabwe_Gonarezhou_Landscape_Chilojo_Cliffs.jpg                                                                                                                  |

	
Scenario: #73539 check verification school status (user has verified school)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	Then I should see user dashboard

Scenario: #73539 check verification school status (user are not membership)
	Given I login to the website
	| username   | password |
	| korycantik | password |
	Then I should see choose a plan page

Scenario: #73539 check verification school status (user are not verified school yet)
	Given I login to the website
	| username | password |
	| samuel   | password |
	Then I should see verification school page

Scenario: #74670 check expired membership
	Given I login to the website
	| username   | password |
	| poerbasari | password |
	Then I should see choose a plan page

Scenario: #84417 check search home as guest by bed room
	Given I am on search homes page
	When I click search 
	And I input number of bed room "2"
	Then I should see the listing that have "2" bed room

Scenario: #84417 check search home as guest by location
	Given I am on search homes page
	And I input search by location 
	| destination | DateFrom    | DateTo      | Person |
	| bandung     | 08-Nov-2016 | 16-Nov-2016 | 2      |
	When I click search
	Then I should see  the result of homes search 
	| address            | avaliability              | userListing  |
	| Bandung, Indonesia | 08 Nov 2016 - 09 Nov 2016 | Kory Listing |

Scenario: #76508 check decline booking pop-up
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	And I click "Decline" link
	Then I should see correct decline pop-up content

Scenario: #76508 check decline booking 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	And I click "Decline" link
	And I click yes button on decline booking pop-up
	Then the listing should be disappear
	And the data should appear in decline booking tab 

Scenario: #72847 check booking request content
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	Then the content of booking request should be OK

Scenario: #72847 check accept booking content
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	And I click "Accepted Bookings" tab
	Then the content of accept booking should be OK

Scenario: #72847 check decline booking content
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"
	And I click "Declined Bookings" tab
	Then the content of decline booking should be OK

Scenario: #74896 check Display Expired Membership Notification Message upon Signing-in
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-display-expired-membership.html"
	Then I should see the content of expred membership notification 

Scenario: #79126 check cancel sharing 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/pop-up-cancel-sharing.html"
	When I click "Cancel" link
	Then I should see the content of cancel sharing other home

Scenario: #76506 check cancel accepted booking pop-up content 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/pop-up-cancel-accepted-booking.html"
	When I click "Accepted Booking" tab
	And I click "Cancel" link
	Then I should see the content of cancel accpeted booking pop-up

Scenario: #76502 check update avaliability pop-up content
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/pop-up-update-availability.html"
	When  I click "Pop up Remaining Availability" link
	Then I should see the content of update avaliability pop-up

Scenario: #70389 check inbox not opened page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-messages-inbox.html"
	Then I should see the content of inbox not opened page

Scenario: #70389 check inbox opened page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-messages-inbox-2.html"
	Then I should see the content of inbox opened page

Scenario: #70389 check archive page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-messages-archive.html"
	Then I should see the content of archive page

Scenario: #70389 check trash page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-messages-trash.html"
	Then I should see the content of trash page

Scenario: #71693 check edit user personal info (profile tab)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	Then I should see the content of edit user personal info (profile tab)

Scenario: #71693 check edit user personal info (listing tab)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	When I click Listings tab
	Then I should see the content of edit user personal info (listing tab)

Scenario: #71693 check edit user personal info (verification tab)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	When I click "Verifications" tab
	Then I should see the content of edit user personal info (verification tab)

Scenario: #71693 check edit user personal info (reviews and recommendations tab)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	When I click "Reviews & Recommendations" tab
	Then I should see the content of edit user personal info (reviews and recommendations tab)

Scenario: #71693 check edit user personal info (testimonial and membership tab)
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	When I click "Testimonial & Membership" tab
	Then I should see the content of edit user personal info (testimonial and membership tab)

Scenario: #71694 check admin edit user listing info
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-listing-info.html"
	Then I should see the content of edit user listing info 

Scenario: #71696 check admin accounting page template
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-accounting.html"
	Then I should see the content of admin accounting page 

Scenario: #85485 check missing button in create voucher page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-manage-voucher-create.html#"
	Then I should see the missing button in create voucher page

Scenario: #71697 check admin manage membership page content 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-manage-membership.html"
	Then I should see the content of admin manage membership page

Scenario: #71698 check admin user listing page content
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-user-listing.html"
	Then I should see the content of admin user listing page

Scenario: #74082 check report pop-up content 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-report-pop-up.html"
	When I click "Report" link
	Then I should see the content of report pop-up

Scenario: #81235 check school verification page content 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-edit-user-personal-info.html"
	When I click "Verifications" tab
	Then I should see the content of edit user personal info (verification tab)

Scenario: #85364 check print list to pdf in Admin Accounting page 
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/admin-accounting-export-to-pdf.html"
	Then I should see the content of print list to pdf in Admin Accounting page

Scenario: #81166 check host profile picture and username in sharing other's home page
	Given I am on FE page "http://ehs.fe.t1.voxteneo.com/public-share-other-home.html"
	Then I should see the picture profile and username  in sharing other's home page

Scenario: #84865 check listing grammar 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I click "Listing" link
	Then I should see the correct listing grammar in listing menu bar
	When I click sharing my home menu 
	Then I should see the correct grammar in tab menu 
	And I should see the sorting icon in sharing my home page
	When I click "Listing" link
	And I click "Sharing Other's Home" link
	Then I should see sorting icon in saharing other's home page

Scenario: #84862 check required fields in my profile page 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I go to profile page 
	When I change the user profile
	| firstName | lastName  | phoneNumber | mobileNumber | profileDescription | email             | searchLocation | addressOne | addressTwo | houseNumber | country   | state     | city    | zipCode |
	| kory      | anggraeni | 0987654321  | 0987654321   | test desccription  | kan@voxteneo.asia | Indonesia      | Bandung    | test       | 22          | Indonesia | Indonesia | Bandung | 12345   |
	Then I click save
	And the required field should not be empty

Scenario: #84862 check change password content in my profile page 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I go to change password page 
	When the change password page is loaded 
	Then I shouldn't see the text "Lorem ipsum dolor sit amet, erat iracundia his at, latine tacimates necessitatibus usu ut."

Scenario: #84862 check delete account content pop-up
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I go to profile page 
	When I click delete account button
	Then I should correct text of delete account pop-up "Your account will be deleted from the list of active users."
	And the password form should be empty

Scenario: #84862 check pubic profile content page 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I click profile menu
	And click public profile sub menu 
	Then I should see the message "This member has not yet entered any profile description." in public profile page 
	And the grammar of public profile page should be correct

 Scenario: #84201 check upload listing photo (image size is more than 2 mb)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I go to listing page 
	When I upload image "C:\\Users\\Voxteneo\\Downloads\\Meteosat7-full-scan.jpg" 
	Then I should see upload image error message

Scenario: #72808 check logout 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I press "Welcome kory" button
	And I press "Log out" button
	Then I should see the pop-up message "You have been logged out!"

Scenario: #72825 check search home as user by location
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I input search by location 
	| destination | DateFrom    | DateTo      | Person |
	|             | 06-Oct-2016 | 09-Oct-2016 | 1      |
	When I click search
	Then I should see  the result of homes search 
	| address            | userListing                |
	| Bandung, Indonesia | My lovely home in Bandung. |

Scenario: #72825 check search home as user by username
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I click username tab
	And I input username "sucitanuary"
	When I click search
	Then I should see  the result of homes search 
	| address            | userListing    |
	| Bandung, Indonesia | Whisnu Listing |  

Scenario: #72825 check search home as user by length of stay 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I click radio button for length of stay
	And I select 10 days
	Then I should see the listing that have length of stay is same or more than 10 days

Scenario: #72825 check search home as user by bed room
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I input number of bed room "2"
	Then I should see the listing that have "2" bed room
	
Scenario: #72825 check search home as user by personal car
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I input personal car feature "Is available for use"
	Then I should see the listing that have personal car is available for use
	
Scenario: #72825 check search home as user by public transportation
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I input public transportation feature "Available within a 15-minute walk"
	Then I should see the listing that have public transportation Available within a 15-minute walk

Scenario: #72825 check search home as user by pet
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I input pet feature "Caring for pets required"
	Then I should see the listing that have Caring for pets required

Scenario: #72825 check search home as user by smoking
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	When I click search 
	And I input smoking feature "Not allowed inside the house"
	Then I should see the listing that Not allowed inside the house

Scenario: #72847 sharing my home (display list booking request)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-my-home"

Scenario: #72821 check display destination 
	Given I open the browser
	When I go to homepage
	Then I should see 5 destination 
	| country   |
	| INDONESIA |
	| ITALY     |
	| SPAIN     |
	| FRANCE    |
	| GERMANY   |

Scenario: #72848 check sharing others home display list
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	When I go to user page "http://ehs.website-test.t1.voxteneo.com/#/user/listing/sharing-other-home"
	Then I should see list of sharing other home
	| BookRef | Username | Message | BookingFrom | BookingTo | BookingStatus      |
	| 21      | zanardi  | test    | 10/10/16    | 19/10/16  | Cancelled by guest |
	| 3       | hhilmi   |         | 11/10/16    | 11/12/16  | Accepted           |

Scenario: #72830 check apply to home with active membership (check form apply booking)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I click username tab
	And I input username "Christine"
	When I click search
	And I click the listing 
	And I press apply now button "2"
	Then I should see correct content

Scenario: #72830 check apply to home with active membership (have a booking different date)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I click username tab
	And I input username "Christine"
	When I click search
	And I click the listing 
	And I press apply now button "2"
	And Input apply booking data
	| message                          | IhaveDifferentBookingDate | dateFrom    | dateTo      |
	| test booking with different date | true                      | 10-Oct-2016 | 10-Oct-2016 |
	And I click submit booking button
	Then I should see message "Your booking request has been sent to the Host."

Scenario: #72830 check apply to home with active membership 
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I click username tab
	And I input username "Christine"
	When I click search
	And I click the listing  
	And I press apply now button "3"
	And Input message for apply booking data "test"
	And I click submit booking button
	Then I should see message "Your booking request has been sent to the Host."

Scenario: #72830 check apply to home with active membership (user has been booked a same listing before)
	Given I login to the website
	| username  | password |
	| anggraeni | password |
	And I am on search homes page
	And I click username tab
	And I input username "Christine"
	When I click search
	And I click the listing  
	And I press apply now button "3"
	And I click submit booking button
	Then I should see message "You already put booking request on this date."



	
