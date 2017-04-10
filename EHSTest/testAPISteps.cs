using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using System.Threading;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json.Linq;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.Globalization;
using Newtonsoft.Json;

namespace EHSTest
{
    [Binding]
    public sealed class testAPISteps
    {
        IWebDriver driver;
        

        [Given(@"I am on API page ""(.*)""")]
        public void GivenIAmOnAPIPage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
            driver.Manage().Window.Maximize();
        }

        [Given(@"I see the text ""(.*)"" in the page")]
        public void GivenISeeTheTextInThePage(string text)
        {
            Assert.AreEqual(text, driver.FindElement(By.XPath("//h1")).Text);
        }

        [When(@"I press test API button")]
        public void WhenIPressTestAPIButton()
        {
            driver.FindElement(By.XPath("//button[@id='testClientButton']")).Click();
        }

        [When(@"I input the username and password")]
        public void WhenIInputTheUsernameAndPassword(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{\"Username\":\"" + username + "\", \"Password\":\"" + password + "\"}");
        }
        
        [When(@"I input the user Id ""(.*)""")]
        public void WhenIInputTheUserId(string userId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(userId);
        }
        
        [When(@"I click send button")]
        public void WhenIClickSendButton()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[3]/div/button")).Click();
            //IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            //var elementToClick = driver.FindElement(By.XPath("//div[3]/div/button"));
           // js.ExecuteScript("arguments[0].click();", elementToClick);
            Thread.Sleep(3000);
        }

        [When(@"I input the testimonial data")]
        public void WhenIInputTheTestimonialData(Table table)
        {
            string no = table.Rows[0]["no"].ToString();
            string Id = table.Rows[0]["Id"].ToString();
            string UserId = table.Rows[0]["UserId"].ToString();
            string UserName = table.Rows[0]["UserName"].ToString();
            string FirstName = table.Rows[0]["FirstName"].ToString();
            string LastName = table.Rows[0]["LastName"].ToString();
            string ShortDescription = table.Rows[0]["ShortDescription"].ToString();
            string Description = table.Rows[0]["Description"].ToString();
            string Approved = table.Rows[0]["Approved"].ToString();
            string ApprovedDate = table.Rows[0]["ApprovedDate"].ToString();
            string CreatedDate = table.Rows[0]["CreatedDate"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            if(no == "1")
            {
                driver.FindElement(By.XPath("//textarea")).SendKeys("[   {     \"Id\": "+ Id + ",     \"UserName\": \"" + UserName + "\",     \"FirstName\": \"" + FirstName + "\",     \"LastName\": \"" + LastName + "\",     \"Approved\": " + Approved + ",     \"ApprovedDate\": \"" + ApprovedDate + "\",     \"CreatedDate\": \"" + CreatedDate + "\",     \"UserId\": \"" + UserId + "\",     \"Description\": \"" + Description + "\"   } ]");
            }
            else
            {
                driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Id\": " + Id + ",   \"UserId\": \"" + UserId + "\",   \"UserName\": \"" + UserName + "\",   \"FirstName\": \"" + FirstName + "\",   \"LastName\": \"" + LastName + "\",   \"ShortDescription\": \"" + ShortDescription + "\",   \"Description\": \"" + Description + "\",   \"Approved\": " + Approved + ",   \"ApprovedDate\": \"" + ApprovedDate + "\",   \"CreatedDate\": \"" + CreatedDate + "\" }");
            }
        }

        [When(@"I input the testimonial id ""(.*)""")]
        public void WhenIInputTheTestimonialId(string id)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(id);
        }

        [Then(@"The result pop-up should be opened")]
        public void ThenTheResultPop_UpShouldBeOpened()
        {
            
        }

        [Then(@"The result pop-up should be opened ""(.*)""")]
        public void ThenTheResultPop_UpShouldBeOpened(string text)
        {
            Assert.AreEqual(text, driver.FindElement(By.XPath("//body/div[3]/div/span")).Text);
        }
        
        [When(@"I add header with token")]
        public string WhenIAddHeaderWithToken(Table table)
        {
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Login");
            WhenIPressTestAPIButton();
            WhenIInputTheUsernameAndPassword(table);
            WhenIClickSendButton();

            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string Token = (string)token.SelectToken("Data.Token");
            string UserId = (string)token.SelectToken("Data.User.UserId");

            driver.Navigate().Back();
            Thread.Sleep(5000);
            WhenIPressTestAPIButton();
            driver.FindElement(By.XPath("//h5/a")).Click();
            driver.FindElement(By.XPath("//div[2]/div/div/input")).SendKeys("Authorization");
            driver.FindElement(By.XPath("//div[2]/div/div/input[2]")).SendKeys("bearer " + Token);

            return UserId;
        }

        [When(@"I input user id and status")]
        public void WhenIInputUserIdAndStatus(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string status = table.Rows[0]["status"].ToString();
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Booking/List/Host/"+userId+"?Status="+status+"&Offset=0&Limit=10&OrderBy=&OrderDirection=");
        }

        [When(@"I input the confrimation verification data")]
        public void WhenIInputTheConfrimationVerificationData(Table table)
        {
            string token = table.Rows[0]["token"].ToString();
            string status = table.Rows[0]["status"].ToString();
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Verification/Confirmation/"+token+"?status="+status);
        }

        [Then(@"Status should be OK")]
        public void ThenStatusShouldBeOK()
        {
            Assert.AreEqual("200/OK", driver.FindElement(By.XPath("//div[3]/div[2]/div/span")).Text);
        }

        [Then(@"get the token")]
        public void ThenGetTheToken()
        {
            Thread.Sleep(100);
        }

        [When(@"I input the slug ""(.*)""")]
        public void WhenIInputTheSlug(string slug)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(slug);
        }

        [When(@"I input the user data")]
        public void WhenIInputTheUserData(Table table)
        {
            string email = table.Rows[0]["email"].ToString();
            string addressOne = table.Rows[0]["addressOne"].ToString();
            string city = table.Rows[0]["city"].ToString();
            string addreseTwo = table.Rows[0]["addreseTwo"].ToString();
            string houseNo = table.Rows[0]["houseNo"].ToString();
            string province = table.Rows[0]["province"].ToString();
            string postalCode = table.Rows[0]["postalCode"].ToString();
            string latitude = table.Rows[0]["latitude"].ToString();
            string logitude = table.Rows[0]["logitude"].ToString();
            string countryId = table.Rows[0]["countryId"].ToString();
            string userId = table.Rows[0]["userId"].ToString();
            string userName = table.Rows[0]["userName"].ToString();
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string homeNumber = table.Rows[0]["homeNumber"].ToString();
            string mobileNumber = table.Rows[0]["mobileNumber"].ToString();
            string profileDescription = table.Rows[0]["profileDescription"].ToString();
            string imageId = table.Rows[0]["imageId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"ConfirmEmail\": \"" + email + "\",   \"UserAddress\": {     \"AddressOne\": \"" + addressOne + "\",     \"City\": \"" + city + "\",     \"AddressTwo\": \"" + addreseTwo + "\",     \"HouseNo\": \"" + houseNo + "\",     \"Province\": \"" + province + "\",     \"PostalCode\": \"" + postalCode + "\",     \"Latitude\": " + latitude + ",     \"Longitude\": " + logitude + ",     \"CountryId\": " + countryId + "   },   \"UserId\": \"" + userId + "\",   \"UserName\": \"" + userName + "\",   \"FirstName\": \"" + firstName + "\",   \"LastName\": \"" + lastName + "\",   \"HomeNumber\": \"" + homeNumber + "\",   \"MobileNumber\": \"" + mobileNumber + "\",   \"ProfileDescription\": \"" + profileDescription + "\",   \"Email\": \"" + email + "\",   \"ImageId\": \"" + imageId + "\" }");
        }

        [When(@"I input the country data")]
        public void WhenIInputTheCountryData(Table table)
        {
            string countryId = table.Rows[0]["countryId"].ToString();
            string name = table.Rows[0]["name"].ToString();
            string imageId = table.Rows[0]["imageId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"CountryId\": \"" + countryId + "\",   \"Name\": \"" + name + "\",     \"ImageId\": \"" + imageId + "}");
        }

        [When(@"I input the news data")]
        public void WhenIInputTheNewsData(Table table)
        {
            string newsId = table.Rows[0]["newsId"].ToString();
            string isPublished = table.Rows[0]["isPublished"].ToString();
            string coverImage = table.Rows[0]["coverImage"].ToString();
            string createBy = table.Rows[0]["createBy"].ToString();
            string updateBy = table.Rows[0]["updateBy"].ToString();
            string newsTranslationId = table.Rows[0]["newsTranslationId"].ToString();
            string title = table.Rows[0]["title"].ToString();
            string shortDescription = table.Rows[0]["shortDescription"].ToString();
            string contents = table.Rows[0]["contents"].ToString();
            string languageId = table.Rows[0]["languageId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"NewsId\": "+newsId+ ",   \"IsPublished\": " + isPublished + ",   \"CoverImageId\": \"" + coverImage + "\",   \"CreatedBy\": \"" + createBy + "\",   \"UpdateBy\": \"" + updateBy + "\",   \"NewsTranslationId\": " + newsTranslationId + ",   \"Title\": \"" + title + "\",   \"ShortDescription\": \"" + shortDescription + "\",   \"Contents\": \"" + contents + "\",   \"LanguageId\": " + languageId + ",   \"MetaDescription\": \"sample string 9\",   \"MetaKeywords\": \"sample string 10\" }");
        }
        
        [When(@"I input the user id data")]
        public void WhenIInputTheUserIdData(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(userId);
        }

        [When(@"I input image id ""(.*)""")]
        public void WhenIInputImageId(string imageId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(imageId);
        }

        [When(@"I input news id ""(.*)""")]
        public void WhenIInputNewsId(string newsId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(newsId);
        }

        [When(@"I input news translation id ""(.*)""")]
        public void WhenIInputNewsTranslationId(string newsTranslationId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(newsTranslationId);
        }
        
        [When(@"I input search data news")]
        public void WhenIInputSearchDataNews(Table table)
        {
            string title = table.Rows[0]["title"].ToString();
            string createDate = table.Rows[0]["createDate"].ToString();
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/News?Title="+title+"&CreatedDate="+createDate+"&Offset=0&Limit=100&OrderBy=&OrderDirection=");
        }

        [When(@"I input the api link ""(.*)""")]
        public void WhenIInputTheApiLink(string link)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys(link);
        }


        [When(@"I input user Id in recommendation ""(.*)""")]
        public void WhenIInputUserIdInRecommendation(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/Recommendation/"+userId+"?Offset=0&Limit=10&OrderBy=&OrderDirection=");
        }

        [When(@"I input user Id and bad request in recommendation ""(.*)""")]
        public void WhenIInputUserIdAndBadRequestInRecommendation(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/Recommendation/" + userId + "?Offset=&Limit=&OrderBy=&OrderDirection=");
        }

        [When(@"I input user Id in review from me ""(.*)""")]
        public void WhenIInputUserIdInReviewFromMe(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/FromMe/"+userId+"?Offset=0&Limit=10&OrderBy=&OrderDirection=");
        }

        [When(@"I input user Id and bad request in review from me ""(.*)""")]
        public void WhenIInputUserIdAndBadRequestInReviewFromMe(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/FromMe/" + userId + "?Offset=&Limit=&OrderBy=&OrderDirection=");
        }

        [When(@"I input user Id in review for me ""(.*)""")]
        public void WhenIInputUserIdInReviewForMe(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/ForMe/" + userId + "?Offset=0&Limit=10&OrderBy=&OrderDirection=");
        }

        [When(@"I input user Id and bad request in review for me ""(.*)""")]
        public void WhenIInputUserIdAndBadRequestInReviewForMe(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/ForMe/" + userId + "?Offset=&Limit=&OrderBy=&OrderDirection=");
        }

        [When(@"I input get news link")]
        public void WhenIInputGetNewsLink()
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/News");
        }

        [When(@"I input generic translation id ""(.*)""")]
        public void WhenIInputGenericTranslationId(string genericTranslationId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(genericTranslationId);
        }

        [When(@"I input generic id ""(.*)""")]
        public void WhenIInputGenericId(string genericId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(genericId);
        }

        [When(@"I input the generic data page data")]
        public void WhenIInputTheGenericDataPageData(Table table)
        {
            string id = table.Rows[0]["id"].ToString();
            string active = table.Rows[0]["active"].ToString();
            string slug = table.Rows[0]["slug"].ToString();
            string createBy = table.Rows[0]["createBy"].ToString();
            string updateBy = table.Rows[0]["updateBy"].ToString();
            string genericContentTranslationId = table.Rows[0]["genericContentTranslationId"].ToString();
            string title = table.Rows[0]["title"].ToString();
            string contents = table.Rows[0]["contents"].ToString();
            string languageId = table.Rows[0]["languageId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Id\": "+id+ ",   \"Type\": \"sample string 2\",   \"IsPublished\": " + active + ",   \"Slug\": \"" + slug + "\",   \"MetaDescription\": \"sample string 5\",   \"MetaKeywords\": \"sample string 6\",  \"CreatedBy\": \"" + createBy + "\",   \"UpdatedBy\": \"" + updateBy + "\",   \"GenericContentTranslationId\": " + genericContentTranslationId + ",   \"Title\": \"" + title + "\",   \"Contents\": \"" + contents + "\",   \"LanguageId\": " +languageId + " }");
        }

        [When(@"I input the about us wrong data page data")]
        public void WhenIInputTheAboutUsWrongDataPageData(Table table)
        {
            string id = table.Rows[0]["id"].ToString();
            string active = table.Rows[0]["active"].ToString();
            string slug = table.Rows[0]["slug"].ToString();
            string createBy = table.Rows[0]["createBy"].ToString();
            string updateBy = table.Rows[0]["updateBy"].ToString();
            string genericContentTranslationId = table.Rows[0]["genericContentTranslationId"].ToString();
            string title = table.Rows[0]["title"].ToString();
            string contents = table.Rows[0]["contents"].ToString();
            string languageId = table.Rows[0]["languageId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Id\": " + id + ",   \"Active\": " + active + ",   \"Slug\": \"" + slug + "\",   \"CreatedBy\": \"" + createBy + "\",   \"UpdatedBy\": \"" + updateBy + "\",   \"GenericContentTranslationId\": " + genericContentTranslationId + ",   \"Title\": \"" + title + "\",   \"Contents\": \"" + contents + "\",   \"aa\": " + languageId + " }");
        }

        [When(@"I input the get image data")]
        public void WhenIInputTheGetImageData(Table table)
        {
            string imageId = table.Rows[0]["imageId"].ToString();
            string width = table.Rows[0]["width"].ToString();
            string height = table.Rows[0]["height"].ToString();
            driver.FindElement(By.CssSelector("input.uriPath")).SendKeys("api/Media/Images/" + imageId + "?width=" + width + "&height=" + height);
        }

        [When(@"I input the testimonial url ""(.*)""")]
        public void WhenIInputTheTestimonialUrl(string approval)
        {
            driver.FindElement(By.CssSelector("input.uriPath")).Clear();
            driver.FindElement(By.CssSelector("input.uriPath")).SendKeys("api/Testimonial/Manages?Approval=" + approval + "&Offset=0&Limit=10&OrderBy=&OrderDirection=");
        }


        [When(@"I input search data listing")]
        public void WhenIInputSearchDataListing(Table table)
        {
            string userName = table.Rows[0]["userName"].ToString();
            string destination = table.Rows[0]["destination"].ToString();
            string UserDestination = table.Rows[0]["UserDestination"].ToString();
            string dateFrom = table.Rows[0]["dateFrom"].ToString();
            string dateTo = table.Rows[0]["dateTo"].ToString();
            string numberPeople = table.Rows[0]["numberPeople"].ToString();
            string numberBedRoom = table.Rows[0]["numberBedRoom"].ToString();
            string lengthOfStay = table.Rows[0]["lengthOfStay"].ToString();
            string isFlexibleLengthOfStay = table.Rows[0]["isFlexibleLengthOfStay"].ToString();
            string Features = table.Rows[0]["Features"].ToString();
            string Offset = table.Rows[0]["Offset"].ToString();
            string Limit = table.Rows[0]["Limit"].ToString();
            driver.FindElement(By.CssSelector("input.uriPath")).Clear();
            driver.FindElement(By.CssSelector("input.uriPath")).SendKeys("api/Listing/Search?UserName="+ userName + "&Destination=" + destination + "&UserDestination=" + UserDestination + "&DateFrom=" + dateFrom + "&DateTo=" + dateTo + "&NumberPeople=" + numberPeople + "&NumberBedRoom=" + numberBedRoom + "&LengthOfStay=" + lengthOfStay + "&IsFlexibleLengthOfStay=" + isFlexibleLengthOfStay + "&Features=" + Features + "&Offset=" + Offset + "&Limit=" + Limit);
        }

        [When(@"I input search public data listing")]
        public void WhenIInputSearchPublicDataListing(Table table)
        {
            string userName = table.Rows[0]["userName"].ToString();
            string destination = table.Rows[0]["destination"].ToString();
            string UserDestination = table.Rows[0]["UserDestination"].ToString();
            string dateFrom = table.Rows[0]["dateFrom"].ToString();
            string dateTo = table.Rows[0]["dateTo"].ToString();
            string numberPeople = table.Rows[0]["numberPeople"].ToString();
            string numberBedRoom = table.Rows[0]["numberBedRoom"].ToString();
            string lengthOfStay = table.Rows[0]["lengthOfStay"].ToString();
            string isFlexibleLengthOfStay = table.Rows[0]["isFlexibleLengthOfStay"].ToString();
            string Features = table.Rows[0]["Features"].ToString();
            string Offset = table.Rows[0]["Offset"].ToString();
            string Limit = table.Rows[0]["Limit"].ToString();
            driver.FindElement(By.CssSelector("input.uriPath")).Clear();
            driver.FindElement(By.CssSelector("input.uriPath")).SendKeys("api/Listing/SearchPublic?UserName=" + userName + "&Destination=" + destination + "&UserDestination=" + UserDestination + "&DateFrom=" + dateFrom + "&DateTo=" + dateTo + "&NumberPeople=" + numberPeople + "&NumberBedRoom=" + numberBedRoom + "&LengthOfStay=" + lengthOfStay + "&IsFlexibleLengthOfStay=" + isFlexibleLengthOfStay + "&Features=" + Features + "&Offset=" + Offset + "&Limit=" + Limit);
        }

        [When(@"I input search data listing\(offset and limit\)")]
        public void WhenIInputSearchDataListingOffsetAndLimit(Table table)
        {
            string Offset = table.Rows[0]["Offset"].ToString();
            string Limit = table.Rows[0]["Limit"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{ \"Offset\": " + Offset + ",  \"Limit\": " + Limit + "}");
        }


        [When(@"I input image id and listing id")]
        public void WhenIInputImageIdAndListingId(Table table)
        {
            string imageId = table.Rows[0]["imageId"].ToString();
            string listingId = table.Rows[0]["listingId"].ToString();
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(imageId);
            driver.FindElement(By.XPath("//div/div/div[2]/input[2]")).SendKeys(listingId);
        }

        [When(@"I input the email verification data")]
        public void WhenIInputTheEmailVerificationData(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string status = table.Rows[0]["status"].ToString();
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Verification/Email/" + userId + "?status=" + status + "");
        }

        [When(@"I data for change password")]
        public void WhenIDataForChangePassword(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string oldPassword = table.Rows[0]["oldPassword"].ToString();
            string newPassword = table.Rows[0]["newPassword"].ToString();
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(userId);
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"OldPassword\": \""+oldPassword+"\",   \"NewPassword\": \""+newPassword+"\",   \"ConfirmPassword\": \""+newPassword+"\" }");
        }

        [When(@"I input the user to delete")]
        public void WhenIInputTheUserToDelete(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();
            string passwordverification = table.Rows[0]["passwordverification"].ToString();
            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userId = WhenIAddHeaderWithToken(Token);

            string[] headeruser = { "userId", "password" };
            string[] rowuser = { userId, passwordverification };
            Table user = new Table(headeruser);
            user.AddRow(rowuser);
            WhenIInputTheUserdataToDelete(user);
        }

        [When(@"I input the userdata to delete")]
        public void WhenIInputTheUserdataToDelete(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \"" + userId + "\",   \"Password\": \"" + password + "\" }");
        }


        [Then(@"check the user email ""(.*)""")]
        public void ThenCheckTheUserEmail(string email)
        {
            driver.Navigate().GoToUrl("http://mailinator.com/");
            driver.FindElement(By.Id("inboxfield")).SendKeys(email);
            driver.FindElement(By.XPath("//div[5]/div")).Click();
        }


        [Then(@"Status should be Bad Request")]
        public void ThenStatusShouldBeBadRequest()
        {
            Assert.AreEqual("400/Bad Request", driver.FindElement(By.XPath("//div[3]/div[2]/div/span")).Text);
        }

        [Then(@"Status should be Unauthorized")]
        public void ThenStatusShouldBeUnauthorized()
        {
            Assert.AreEqual("401/Unauthorized", driver.FindElement(By.XPath("//div[3]/div[2]/div/span")).Text);
        }

        [Then(@"Status should be Not Found")]
        public void ThenStatusShouldBeNotFound()
        {
            Assert.AreEqual("404/Not Found", driver.FindElement(By.XPath("//div[3]/div[2]/div/span")).Text);
        }

        [Then(@"I check view the user data")]
        public void ThenICheckViewTheUserData(Table table)
        {
            GivenIAmOnAPIPage("http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Users-UserId");
            WhenIPressTestAPIButton();
            WhenIInputTheUserId("1138c45b-9d40-4a8f-aa01-fe17518d0c2d");
            WhenIAddHeaderWithToken(table);
            WhenIClickSendButton();
        }

        [When(@"I input the page list url")]
        public void WhenIInputThePageListUrl()
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/StaticPages/All?Title=&Slug=&PublishedDate=&SearchValue=&Offset=&Limit=&OrderBy=&OrderDirection=");
        }

        [When(@"I input the listing id ""(.*)""")]
        public void WhenIInputTheListingId(string listingId)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(listingId);
        }

        [When(@"I input the user for filter data")]
        public void WhenIInputTheUserForFilterData(Table table)
        {
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string offset = table.Rows[0]["offset"].ToString();
            string limit = table.Rows[0]["limit"].ToString();
            string orderBy = table.Rows[0]["orderBy"].ToString();
            string orderDirection = table.Rows[0]["orderDirection"].ToString();
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Users?FirstName="+ firstName + "&LastName=" + lastName + "&Email=" + email + "&Offset=" + offset + "&Limit=" + limit + "&OrderBy=" + orderBy + "&OrderDirection=" + orderDirection + "");
        }

        [When(@"I input the user data for fb verification")]
        public void WhenIInputTheUserDataForFbVerification(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string accessToken = table.Rows[0]["accessToken"].ToString();
            string expireIn = table.Rows[0]["expireIn"].ToString();
            string signedRequest = table.Rows[0]["signedRequest"].ToString();
            string userID = table.Rows[0]["userID"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \""+ userId + "\",   \"FacebookResponse\": {     \"AccessToken\": \"" + accessToken + "\",     \"ExpiresIn\": " + expireIn  + ",     \"SignedRequest\": \"" + signedRequest + "\",     \"UserID\": \"" + userID + "\"   } }");
        }

        [When(@"I input the user data for school verification")]
        public void WhenIInputTheUserDataForSchoolVerification(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string name = table.Rows[0]["name"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string verSchoolName = table.Rows[0]["verSchoolName"].ToString();
            string verSchoolWebsite = table.Rows[0]["verSchoolWebsite"].ToString();
            string verSchoolAddress = table.Rows[0]["verSchoolAddress"].ToString();
            string verSchoolPhone = table.Rows[0]["verSchoolPhone"].ToString();
            string verContactPerson = table.Rows[0]["verContactPerson"].ToString();
            string verContactEmail = table.Rows[0]["verContactEmail"].ToString();
            string StandardVerification = table.Rows[0]["StandardVerification"].ToString();
            string verContactPhone = table.Rows[0]["verContactPhone"].ToString();
            string Message = table.Rows[0]["Message"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \""+ userId + "\",   \"Name\": \"" + name + "\",   \"Email\": \"" + email + "\",   \"VerSchoolName\": \"" + verSchoolName + "\",   \"VerSchoolWebsite\": \"" + verSchoolWebsite + "\",   \"VerSchoolAddress\": \"" + verSchoolAddress + "\",    \"VerSchoolPhone\": \"" + verSchoolPhone + "\",  \"VerContactPerson\": \"" + verContactPerson + "\",   \"verContactEmail\": \"" + verContactEmail + "\", \"VerContactPhone\": \"" + verContactPhone + "\", \"StandardVerification\": \"" + StandardVerification + "\", \"Message\": \"" + Message + "\" }");
        }

        [When(@"I input testimonial data")]
        public void WhenIInputTestimonialData(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();
            string description = table.Rows[0]["description"].ToString();
            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userId = WhenIAddHeaderWithToken(Token);
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \"" + userId + "\",   \"Description\": \"" + description + "\"}");
        }

        [When(@"I input the listing data")]
        public void WhenIInputTheListingData(Table table)
        {
            string title = table.Rows[0]["title"].ToString();
            string numberPeople = table.Rows[0]["numberPeople"].ToString();
            string numberBedRoom = table.Rows[0]["numberBedRoom"].ToString();
            string undecided = table.Rows[0]["undecided"].ToString();
            string publicShare = table.Rows[0]["publicShare"].ToString();
            string useUserAddress = table.Rows[0]["useUserAddress"].ToString();
            string id = table.Rows[0]["id"].ToString();
            string orderNo = table.Rows[0]["orderNo"].ToString();
            string startDate = table.Rows[0]["startDate"].ToString();
            string endDate = table.Rows[0]["endDate"].ToString();
            string flexibilityDate = table.Rows[0]["flexibilityDate"].ToString();
            string features = table.Rows[0]["features"].ToString();
            string addressOne = table.Rows[0]["addressOne"].ToString();
            string addressTwo = table.Rows[0]["addressTwo"].ToString();
            string houseNo = table.Rows[0]["houseNo"].ToString();
            string city = table.Rows[0]["city"].ToString();
            string province = table.Rows[0]["province"].ToString();
            string postalCode = table.Rows[0]["postalCode"].ToString();
            string latitude = table.Rows[0]["latitude"].ToString();
            string longitude = table.Rows[0]["longitude"].ToString();
            string countryId = table.Rows[0]["countryId"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            if(id == "0")
            {
                driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Title\": \"" + title + "\",   \"Description\": \"sample string 2\",   \"NumberPeople\": " + numberPeople + ",   \"NumberBedRoom\": " + numberBedRoom + ",   \"Undecided\": " + undecided + ",   \"PublicShare\": " + publicShare + ",   \"UseUserAddress\": " + useUserAddress + ",   \"ListingAvailabilities\": [     {\"OrderNo\": " + orderNo + ",       \"FlexibilityDate\": " + flexibilityDate + ",       \"StartDate\": \"" + startDate + "\",       \"EndDate\": \"" + endDate + "\"     } ],   \"Features\": [  " + features + "  ],   \"ListingAddress\": {     \"AddressOne\": \"" + addressOne + "\",     \"AddressTwo\": \"" + addressTwo + "\",     \"HouseNo\": \"" + houseNo + "\",     \"City\": \"" + city + "\",     \"Province\": \"" + province + "\",     \"PostalCode\": \"" + postalCode + "\",     \"Latitude\": " + latitude + ",     \"Longitude\": " + longitude + ",     \"CountryId\": " + countryId + "   } }");
            }
            else
            {
                driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Title\": \"" + title + "\",   \"Description\": \"sample string 2\",   \"NumberPeople\": " + numberPeople + ",   \"NumberBedRoom\": " + numberBedRoom + ",   \"Undecided\": " + undecided + ",   \"PublicShare\": " + publicShare + ",   \"UseUserAddress\": " + useUserAddress + ",   \"ListingAvailabilities\": [     {       \"Id\": " + id + ",       \"OrderNo\": " + orderNo + ",       \"FlexibilityDate\": " + flexibilityDate + ",       \"StartDate\": \"" + startDate + "\",       \"EndDate\": \"" + endDate + "\"     } ],   \"Features\": [  " + features + "  ],   \"ListingAddress\": {     \"AddressOne\": \"" + addressOne + "\",     \"AddressTwo\": \"" + addressTwo + "\",     \"HouseNo\": \"" + houseNo + "\",     \"City\": \"" + city + "\",     \"Province\": \"" + province + "\",     \"PostalCode\": \"" + postalCode + "\",     \"Latitude\": " + latitude + ",     \"Longitude\": " + longitude + ",     \"CountryId\": " + countryId + "   } }");
            }
        }

        [When(@"I see the text ""(.*)"" in the page")]
        public void WhenISeeTheTextInThePage(string text)
        {
            Assert.AreEqual(text, driver.FindElement(By.XPath("//h1")).Text);
        }

        [Then(@"I shouldn't see phone field")]
        public void ThenIShouldnTSeePhoneField()
        {
            Assert.IsFalse(driver.PageSource.Contains("phone"));
        }

        [When(@"I input image listing data")]
        public void WhenIInputImageListingData(Table table)
        {
            string listingId = table.Rows[0]["listingId"].ToString();
            string imageId = table.Rows[0]["imageId"].ToString();
            string isDefault = table.Rows[0]["isDefault"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"ListingId\": "+ listingId + ",   \"ImageId\": \"" + imageId + "\",   \"IsDefault\": " + isDefault + " }");
        }

        [When(@"I input listing avalibiity data")]
        public void WhenIInputListingAvalibiityData(Table table)
        {
            string ListingAvailabilityId = table.Rows[0]["ListingAvailabilityId"].ToString();
            string BookingMessage = table.Rows[0]["BookingMessage"].ToString();
            string StartDate = table.Rows[0]["StartDate"].ToString();
            string EndDate = table.Rows[0]["EndDate"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"ListingAvailabilityId\": "+ ListingAvailabilityId + ",   \"BookingMessage\": \"" + BookingMessage + "\",   \"StartDate\": \"" + StartDate + "\",   \"EndDate\": \"" + EndDate + "\" }");
        }

        [When(@"I input booking reference ""(.*)""")]
        public void WhenIInputBookingReference(string bookingReference)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(bookingReference);
        }

        [When(@"I input cancel booking  data")]
        public void WhenIInputCancelBookingData(Table table)
        {
            string BookReference = table.Rows[0]["BookReference"].ToString();
            string BookingCancelMessage = table.Rows[0]["BookingCancelMessage"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"BookReference\": "+ BookReference + ",   \"BookingCancelMessage\": \"" + BookingCancelMessage + "\" }");
        }

        [When(@"I input the user Id ""(.*)"" to the url")]
        public void WhenIInputTheUserIdToTheUrl(string userId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Booking/List/User/" + userId);
        }

        [Then(@"the result shouldn't be empty")]
        public void ThenTheResultShouldnTBeEmpty()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var data = token.SelectToken("Data");
            Assert.IsTrue(data.Count() > 0);
        }

        [Then(@"data should be empty")]
        public void ThenDataShouldBeEmpty()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var data = token.SelectToken("Data");
            Assert.IsTrue(data.Count() == 0);
        }


        [Then(@"the result should been have (.*) data")]
        public void ThenTheResultShouldBeenHaveData(int result)
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var data = token.SelectToken("Data");
            Assert.AreEqual(data.Count(), result);
        }


        [When(@"I input the testimonial")]
        public void WhenIInputTheTestimonial(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string description = table.Rows[0]["description"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \""+ userId +"\",   \"Description\": \"" +description+ "\" }");
        }

        [When(@"I input the invitation data")]
        public void WhenIInputTheInvitationData(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string name = table.Rows[0]["name"].ToString();
            string message = table.Rows[0]["message"].ToString();
            if(userId == ""){

                string[] header = { "username", "password" };
                string[] row = { "anggraeni", "password" };
                Table Token = new Table(header);
                Token.AddRow(row);
                userId= WhenIAddHeaderWithToken(Token);
            }
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \""+ userId + "\",   \"Email\": \"" + email + "\",   \"Name\": \"" + name + "\",   \"Message\": \"" + message + "\" }");
        }

        [Then(@"the data should see the data")]
        public void ThenTheDataShouldSeeTheData(Table table)
        {
            string userId = table.Rows[0]["userId"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string name = table.Rows[0]["name"].ToString();
            string message = table.Rows[0]["message"].ToString();

            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string UserId = (string)token.SelectToken("Data.UserId");
            string Email = (string)token.SelectToken("Data.Email");
            string Name = (string)token.SelectToken("Data.Name");
            string Message = (string)token.SelectToken("Data.Message");

            Assert.AreEqual(userId, UserId);
            Assert.AreEqual(email, Email);
            Assert.AreEqual(name, Name);
            Assert.AreEqual(message, Message);
        }

        [Then(@"I should see the message ""(.*)""")]
        public void ThenIShouldSeeTheMessage(string msg)
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string Message = (string)token.SelectToken("Message");
            Assert.AreEqual(msg, Message);
        }

        [Then(@"I should see the msg ""(.*)""")]
        public void ThenIShouldSeeTheMsg(string msg)
        {
            string Message = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            Assert.AreEqual(msg, Message);
        }

        [When(@"Input the listing avaliabiity id ""(.*)""")]
        public void WhenInputTheListingAvaliabiityId(string listingAvaliabilityId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Booking/Validate/ApplyNow/" + listingAvaliabilityId);
        }

        [Given(@"I invite someone")]
        public void GivenIInviteSomeone()
        {
            GivenIAmOnAPIPage("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Users-Invitation");

            string[] header = { "username", "password" };
            string[] row = { "anggraeni", "password" };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userID = WhenIAddHeaderWithToken(Token);
            string[] header1 = { "userId", "email", "name", "message" };
            string[] row1 = { userID, "bauketek12@mailinator.com", "korytest", "test" };
            Table user = new Table(header1);
            user.AddRow(row1);
            WhenIInputTheInvitationData(user);
            WhenIClickSendButton();
            ThenStatusShouldBeOK();
        }

        [When(@"someone do register as user")]
        public void WhenSomeoneDoRegisterAsUser(Table table)
        {
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver.Navigate().GoToUrl("https://www.mailinator.com/");
            driver.FindElement(By.Id("inboxfield")).SendKeys(email);
            driver.FindElement(By.CssSelector("button.btn.btn-dark")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[5]/div")).Click();
            Thread.Sleep(2000);
            var tinymce_frame = driver.FindElement(By.Id("publicshowmaildivcontent"));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.CssSelector("a"));
            string url = tinymce_body.GetAttribute("href");

            driver.SwitchTo().DefaultContent();
            var qs = ParseQueryString(url);
            string myUri = qs["url"];
            string myUrl = Uri.UnescapeDataString(myUri);
            var parserMyUrl = ParseQueryString(myUrl);
            string referalCode = parserMyUrl["ReferalCode"];

            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Register");
            WhenIPressTestAPIButton();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Email\": \"" + email + "\",   \"Username\": \"" + username + "\",   \"FirstName\": \"" + firstName + "\",   \"LastName\": \"" + lastName + "\",   \"Password\": \"" + password + "\",   \"ConfirmPassword\": \"" + password + "\",   \"ReferralCode\": \"" + referalCode + "\" }");
            WhenIClickSendButton();
        }

        [When(@"user choose a plan (.*)")]
        public void WhenUserChooseAPlan(string planRference)
        {
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Memberships-Purchase");
            string[] header = { "username", "password" };
            string[] row = { "bauketek12", "testpassword" };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userID = WhenIAddHeaderWithToken(Token);
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"PlanReference\": "+ planRference +",   \"UserId\": \""+ userID +"\" }");
            WhenIClickSendButton();
        }

        [When(@"user send school verification")]
        public void WhenUserSendSchoolVerification(Table table)
        {
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-School");
            string[] header = { "username", "password" };
            string[] row = { "bauketek12", "testpassword" };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userID = WhenIAddHeaderWithToken(Token);
            string name = table.Rows[0]["name"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string verSchoolName = table.Rows[0]["verSchoolName"].ToString();
            string verSchoolWebsite = table.Rows[0]["verSchoolWebsite"].ToString();
            string verSchoolAddress = table.Rows[0]["verSchoolAddress"].ToString();
            string verContactPerson = table.Rows[0]["verContactPerson"].ToString();
            string verContactEmail = table.Rows[0]["verContactEmail"].ToString();
            string educatorStatus = table.Rows[0]["educatorStatus"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserId\": \""+ userID + "\",   \"Name\": \"" + name + "\",   \"Email\": \"" + email + "\",   \"VerSchoolName\": \"" + verSchoolName + "\",   \"VerSchoolWebsite\": \"" + verSchoolWebsite + "\",   \"VerSchoolAddress\": \"" + verSchoolAddress + "\",   \"VerContactPerson\": \"" + verContactPerson + "\",   \"VerContactEmail\": \"" + verContactEmail + "\",   \"VerContactPhone\": \"" + verContactPerson + "\",   \"EducatorStatus\": " + educatorStatus + " }");
            WhenIClickSendButton();
        }

        [When(@"School confrim the user (.*)")]
        public void WhenSchoolConfrimTheUser(string verContactEmail)
        {
            driver.Navigate().GoToUrl("https://www.mailinator.com/");
            driver.FindElement(By.Id("inboxfield")).SendKeys(verContactEmail);
            driver.FindElement(By.CssSelector("button.btn.btn-dark")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[5]/div")).Click();
            Thread.Sleep(2000);
            var tinymce_frame = driver.FindElement(By.Id("publicshowmaildivcontent"));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.LinkText("Is currently employed at this school"));
            string url = tinymce_body.GetAttribute("href");

            driver.SwitchTo().DefaultContent();
            var qs = ParseQueryString(url);
            string myUri = qs["url"];
            string myUrl = Uri.UnescapeDataString(myUri);
            var parserMyUrl = ParseQueryString(myUrl);
            string token = (myUrl.Split('/').Last()).Split('?').First();
            string status = parserMyUrl["status"];
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status");
            WhenIPressTestAPIButton();
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(token);
            driver.FindElement(By.XPath("//div/div/div[2]/input[2]")).SendKeys(status);
            WhenIClickSendButton();
            ThenStatusShouldBeOK();
        }

        [Then(@"I should get (.*) days free")]
        public void ThenIShouldGetMonthFree(int extend)
        {
            string[] header = { "username", "password" };
            string[] row = { "anggraeni", "password" };
            Table Token = new Table(header);
            Token.AddRow(row);
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Account-Login");
            WhenIPressTestAPIButton();
            WhenIInputTheUsernameAndPassword(Token);
            WhenIClickSendButton();

            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string UserId = (string)token.SelectToken("Data.User.UserId");

            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/GET-api-Memberships-Status-UserId");
            WhenIPressTestAPIButton();
            WhenIInputTheUserId(UserId);
            WhenIClickSendButton();

            DateTime dt = DateTime.Parse("2016-09-12");
            var ExpDate = dt.AddDays(extend);
            string Expired_Date = ExpDate.ToString();

            string y = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken tokenparse = JObject.Parse(y);
            string getexpDate = (string)tokenparse.SelectToken("Data.ExpDate");
            DateTime expdate = DateTime.Parse(getexpDate);
            string expired_date = expdate.ToString();

            Assert.AreEqual(expired_date, Expired_Date);
        }
        
        public NameValueCollection ParseQueryString(string s)
        {
            NameValueCollection nvc = new NameValueCollection();
            // remove anything other than query string from url
            if (s.Contains("?"))
            {
                s = s.Substring(s.IndexOf('?') + 1);
            }
            foreach (string vp in Regex.Split(s, "&"))
            {
                string[] singlePair = Regex.Split(vp, "=");
                if (singlePair.Length == 2)
                {
                    nvc.Add(singlePair[0], singlePair[1]);
                }
                else
                {
                    // only one key with no value specified in query string
                    nvc.Add(singlePair[0], string.Empty);
                }
            }
            return nvc;
        }

        [Given(@"test ""(.*)""")]
        public void GivenTest(string verContactEmail)
        {
            driver = new FirefoxDriver();
            //driver.Navigate().GoToUrl("https://www.mailinator.com/");
            //driver.FindElement(By.Id("inboxfield")).SendKeys(verContactEmail);
            //driver.FindElement(By.CssSelector("button.btn.btn-dark")).Click();
            //Thread.Sleep(2000);
            // driver.FindElement(By.XPath("//div[2]/div[2]/div[5]/div")).Click();
            // Thread.Sleep(2000);
            // var tinymce_frame = driver.FindElement(By.Id("publicshowmaildivcontent"));
            // driver.SwitchTo().Frame(tinymce_frame);
            // var tinymce_body = driver.FindElement(By.LinkText("Is currently employed at this school"));
            //string url = tinymce_body.GetAttribute("href");

            // driver.SwitchTo().DefaultContent();
            //var qs = ParseQueryString("http://astral-test.t1.voxteneo.com/en/Customer/Index?hdhh=987405");
            //string myUri = qs["url"];
            string myUrl = "http://astral-test.t1.voxteneo.com/en/Customer/Index?hdhh=987405";//Uri.UnescapeDataString(myUri);
            var parserMyUrl = ParseQueryString(myUrl);
            string token = (myUrl.Split('/').Last()).Split('?').First();
            string status = parserMyUrl["status"];
            driver.Navigate().GoToUrl("http://ehs.api-test.t1.voxteneo.com/Help/Api/POST-api-Verification-Confirmation-token_status");
            WhenIPressTestAPIButton();
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(token);
            driver.FindElement(By.XPath("//div/div/div[2]/input[2]")).SendKeys(status);
            WhenIClickSendButton();
            ThenStatusShouldBeOK();
        }

        [Then(@"The referal code should be appear in the email ""(.*)""")]
        public void ThenTheReferalCodeShouldBeAppearInTheEmail(string email)
        {
            driver.Navigate().GoToUrl("https://www.mailinator.com/");
            driver.FindElement(By.Id("inboxfield")).SendKeys(email);
            driver.FindElement(By.CssSelector("button.btn.btn-dark")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[5]/div")).Click();
            Thread.Sleep(2000);
            var tinymce_frame = driver.FindElement(By.Id("publicshowmaildivcontent"));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.CssSelector("a"));
            string url = tinymce_body.GetAttribute("href");

            driver.SwitchTo().DefaultContent();
            var qs = ParseQueryString(url);
            string myUri = qs["url"];
            string myUrl = Uri.UnescapeDataString(myUri);
            var parserMyUrl = ParseQueryString(myUrl);
            string referalCode = parserMyUrl["ReferalCode"];
            Assert.IsNotNull(referalCode);
        }
        
        [Then(@"the result should show (.*) data")]
        public void ThenTheResultShouldShowData(int data)
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            int result = (int)token.SelectToken("Data").Count();
            Assert.AreEqual(data, result);
        }

        [Then(@"I should see the username of the data")]
        public void ThenIShouldSeeTheUsernameOfTheData()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string user = (string)token.SelectToken("Data.User.UserName");
            string host = (string)token.SelectToken("Data.Host.UserName");
            Assert.IsNotNull(user);
            Assert.IsNotNull(host);
        }

        [When(@"I input report data")]
        public void WhenIInputReportData(Table table)
        {
            string userIdReporting = table.Rows[0]["userIdReporting"].ToString();
            string userIdReported = table.Rows[0]["userIdReported"].ToString();
            string Subject = table.Rows[0]["Subject"].ToString();
            string Message = table.Rows[0]["Message"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserIdReport\": \""+ userIdReporting + "\",   \"UserIdReported\": \"" + userIdReported +"\",   \"Subject\": \"" + Subject +"\",   \"Message\": \"" + Message +"\" }");
        }

        [When(@"I input total testimonial (.*)")]
        public void WhenIInputTotalTestimonial(string total)
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(total);
        }

        [When(@"I input edit testimonial data")]
        public void WhenIInputEditTestimonialData(Table table)
        {
            //string username = table.Rows[0]["username"].ToString();
            //string password = table.Rows[0]["password"].ToString();
            string id = table.Rows[0]["id"].ToString();
            string description = table.Rows[0]["description"].ToString();
            string approved = table.Rows[0]["approved"].ToString();
           // string[] header = { "username", "password" };
           // string[] row = { username, password };
            //Table Token = new Table(header);
            //Token.AddRow(row);
            //string userId = WhenIAddHeaderWithToken(Token);
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Id\": " + id + ",   \"Description\": \"" + description + "\",   \"Approved\": " + approved +" }");
        }

        [Then(@"user id should be appear in the result")]
        public void ThenUserIdShouldBeAppearInTheResult()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string UserId = (string)token.SelectToken("Data[0].UserId");
            Assert.IsNotNull(UserId);
        }

        [When(@"I input contact me data")]
        public void WhenIInputContactMeData(Table table)
        {
            string ReceiverId = table.Rows[0]["ReceiverId"].ToString();
            string Subject = table.Rows[0]["Subject"].ToString();
            string Body = table.Rows[0]["Body"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"ReceiverId\": \""+ ReceiverId + "\",   \"Subject\": \"" + Subject + "\",   \"Body\": \"" + Body + "\" }");
        }

        [When(@"I input username ""(.*)""")]
        public void WhenIInputUsername(string username)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(username);
        }

        [When(@"I input received id to inbox")]
        public void WhenIInputReceivedIdToInbox(Table table)
        {
            string UserId = WhenIAddHeaderWithToken(table);
            WhenIInputTheReceiveidToInbox(UserId);
        }

        [Then(@"the message data should be appear")]
        public void ThenTheMessageDataShouldBeAppear()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string Id = (string)token.SelectToken("Data[0].Id");
            string SenderId = (string)token.SelectToken("Data[0].SenderId");
            string Subject = (string)token.SelectToken("Data[0].Subject");
            string Body = (string)token.SelectToken("Data[0].Body");

            Assert.IsNotNull(Id);
            Assert.IsNotNull(SenderId);
            Assert.IsNotNull(Subject);
            Assert.IsNotNull(Body);
        }

        [Then(@"the data should empty")]
        public void ThenTheDataShouldEmpty()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var data = token.SelectToken("Data");
            Assert.IsTrue(data.Count() < 1);
        }

        [When(@"I input the receiveid ""(.*)"" to inbox")]
        public void WhenIInputTheReceiveidToInbox(string UserId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Messages/GetInbox?ReceiverId=" + UserId);
        }

        [When(@"I input received id to archive")]
        public void WhenIInputReceivedIdToArchive(Table table)
        {
            string UserId = WhenIAddHeaderWithToken(table);
            WhenIInputTheReceiveidToArchive(UserId);
        }

        [When(@"I input the receiveid ""(.*)"" to archive")]
        public void WhenIInputTheReceiveidToArchive(string UserId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Messages/GetArchived?ReceiverId=" + UserId);
        }

        [When(@"I input message id that want to moved")]
        public void WhenIInputMessageIdThatWantToMoved(Table table)
        {
            string messageId = table.Rows[0]["messageId"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string ReceiverId = WhenIAddHeaderWithToken(Token);
            WhenIInputMessageIdAndReceivedId(messageId, ReceiverId);
        }

        [When(@"I input message id ""(.*)"" and received id ""(.*)""")]
        public void WhenIInputMessageIdAndReceivedId(string messageId, string ReceiverId)
        {
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"ReceiverId\": \"" + ReceiverId + "\",   \"Id\": [" + messageId + "] }");
        }

        [When(@"I input message id that want to delete")]
        public void WhenIInputMessageIdThatWantToDelete(Table table)
        {
            string messageId = table.Rows[0]["messageId"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string ReceiverId = WhenIAddHeaderWithToken(Token);
            WhenIInputMessageIdAndReceivedId(messageId, ReceiverId);
        }

        [When(@"I input received id to trash")]
        public void WhenIInputReceivedIdToTrash(Table table)
        {
            string UserId = WhenIAddHeaderWithToken(table);
            WhenIInputTheReceiveidToTrash(UserId);
        }

        [When(@"I input the receiveid ""(.*)"" to trash")]
        public void WhenIInputTheReceiveidToTrash(string UserId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Messages/GetTrash?ReceiverId=" + UserId);
        }

        [Then(@"source should be appear")]
        public void ThenSourceShouldBeAppear()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var source = token.SelectToken("Data[0].CoverImage.Source");
            Assert.IsNotNull(source);   
        }

        [When(@"I input user id to show review for me")]
        public void WhenIInputUserIdToShowReviewForMe(Table table)
        {
            string UserId = WhenIAddHeaderWithToken(table);
            WhenIInputTheUseridToShowReviewForMe(UserId);
        }

        [Then(@"the data should be appear")]
        public void ThenTheDataShouldBeAppear()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            var data = token.SelectToken("Data");
            Assert.IsTrue(data.Count() > 0);
        }

        [When(@"I input the userid ""(.*)"" to show review for me")]
        public void WhenIInputTheUseridToShowReviewForMe(string UserId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/ForMe/" + UserId);
        }

        [When(@"I input user id to show review from me")]
        public void WhenIInputUserIdToShowReviewFromMe(Table table)
        {
            string UserId = WhenIAddHeaderWithToken(table);
            WhenIInputTheUseridToShowReviewFromMe(UserId);
        }

        [When(@"I input the userid ""(.*)"" to show review from me")]
        public void WhenIInputTheUseridToShowReviewFromMe(string UserId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Listing/Review/FromMe/" + UserId);
        }

        [When(@"I input user id to report")]
        public void WhenIInputUserIdToReport(Table table)
        {
            string userIdToReport = table.Rows[0]["userIdToReport"].ToString();
            string subject = table.Rows[0]["subject"].ToString();
            string message = table.Rows[0]["message"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string userIdReported = WhenIAddHeaderWithToken(Token);

            string[] headerReport = { "userIdToReport", "userIdReported", "subject", "message" };
            string[] rowReport = { userIdToReport, userIdReported, subject, message };
            Table report = new Table(headerReport);
            report.AddRow(rowReport);
            WhenIInputUseridToReport(report);
        }

        [When(@"I input userid to report")]
        public void WhenIInputUseridToReport(Table table)
        {
            string userIdToReport = table.Rows[0]["userIdToReport"].ToString();
            string userIdReported = table.Rows[0]["userIdReported"].ToString();
            string subject = table.Rows[0]["subject"].ToString();
            string message = table.Rows[0]["message"].ToString();
            
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"UserIdReport\": \""+ userIdToReport + "\",   \"UserIdReported\": \"" + userIdReported + "\",   \"Subject\": \"" + subject + "\",   \"Message\": \"" + message + "\" }");
        }

        [When(@"I input paypal data")]
        public void WhenIInputPaypalData(Table table)
        {
            string PlanId = table.Rows[0]["PlanId"].ToString();
            string transactionid = table.Rows[0]["transactionid"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string UserId = WhenIAddHeaderWithToken(Token);

            string[] headertransaction = { "PlanId", "transactionid", "userId"};
            string[] rowtransaction = { PlanId, transactionid, UserId };
            Table transaction = new Table(headertransaction);
            transaction.AddRow(rowtransaction);
            WhenIInputDataOfPaypal(transaction);
        }

        [When(@"I input data of paypal")]
        public void WhenIInputDataOfPaypal(Table table)
        {
            string PlanId = table.Rows[0]["PlanId"].ToString();
            string transactionid = table.Rows[0]["transactionid"].ToString();
            string UserId = table.Rows[0]["userId"].ToString();

            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"PlanId\": "+ PlanId + ",   \"UserId\": \"" + UserId + "\",   \"TransactionId\": \"" + transactionid + "\" }");
        }

        [When(@"I input contact us data")]
        public void WhenIInputContactUsData(Table table)
        {
            string email = table.Rows[0]["email"].ToString();
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string message = table.Rows[0]["message"].ToString();
            string Category = table.Rows[0]["Category"].ToString();
            string ImageUrl = table.Rows[0]["ImageUrl"].ToString();

            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"Email\": \""+ email + "\",  \"FirstName\": \"" + firstName + "\",  \"LastName\": \"" + lastName + "\",  \"Message\": \"" + message + "\",  \"Category\": \"" + Category + "\",  \"ImagesURL\": [    \"" + ImageUrl + "\"  ]}");
        }

        [When(@"input the register data")]
        public void WhenInputTheRegisterData(Table table)
        {
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"Email\": \"" + email + "\",   \"Username\": \"" + username + "\",   \"FirstName\": \"" + firstName + "\",   \"LastName\": \"" + lastName + "\",   \"Password\": \"" + password + "\",   \"ConfirmPassword\": \"" + password + "\",   \"ReferralCode\": \"\" }");
        }

        [When(@"I input country Id ""(.*)""")]
        public void WhenIInputCountryId(string countryId)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Country/" + countryId);
        }

        [Then(@"I should the image orientation")]
        public void ThenIShouldTheImageOrientation()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string Token = (string)token.SelectToken("Data.Token");
            string orientation = (string)token.SelectToken("Data.CoverImage.IsPortrait");
            Assert.IsNotNull(orientation);
        }

        [Then(@"I should the image orientation in listing data")]
        public void ThenIShouldTheImageOrientationInListingData()
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string Token = (string)token.SelectToken("Data.Token");
            string orientation = (string)token.SelectToken("Data.ListingAddress.Country.CoverImage.IsPortrait");
            Assert.IsNotNull(orientation);
        }

        [When(@"I input the user Id")]
        public void WhenIInputTheUserId(Table table)
        {
            string userId = WhenIAddHeaderWithToken(table);
            WhenIInputTheUserId(userId);
        }

        [When(@"I input voucherdata")]
        public void WhenIInputVoucherdata(Table table)
        {
            string VoucherNumber = table.Rows[0]["VoucherNumber"].ToString();
            string Reason = table.Rows[0]["Reason"].ToString();
            string UserNameEmail = table.Rows[0]["UserNameEmail"].ToString();
            string VoucherLength = table.Rows[0]["VoucherLength"].ToString();
            string Expired = table.Rows[0]["Expired"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{   \"VoucherNumber\": \""+ VoucherNumber + "\",   \"Reason\": \"" + Reason + "\",   \"UserNameEmail\": \"" + UserNameEmail + "\",   \"VoucherLength\": " + VoucherLength + ",   \"Expired\": " + Expired + " }");
        }

        [When(@"I input voucher data")]
        public void WhenIInputVoucherData(Table table)
        {
            string VoucherNumber = table.Rows[0]["VoucherNumber"].ToString();
            string Reason = table.Rows[0]["Reason"].ToString();
            string UserNameEmail = table.Rows[0]["UserNameEmail"].ToString();
            string VoucherLength = table.Rows[0]["VoucherLength"].ToString();
            string Expired = table.Rows[0]["Expired"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            WhenIAddHeaderWithToken(Token);

            string[] headervoucher = { "VoucherNumber", "Reason", "UserNameEmail", "VoucherLength", "Expired" };
            string[] rowvoucher = { VoucherNumber, Reason, UserNameEmail, VoucherLength, Expired };
            Table voucher = new Table(headervoucher);
            voucher.AddRow(rowvoucher);
            WhenIInputVoucherdata(voucher);
        }

        [When(@"I input vouchernumber data ""(.*)""")]
        public void WhenIInputVouchernumberData(string VoucherNumber)
        {
            driver.FindElement(By.XPath("//div/div/div/input[2]")).SendKeys(VoucherNumber);
        }

        [When(@"I input voucher number data")]
        public void WhenIInputVoucherNumberData(Table table)
        {
            string VoucherNumber = table.Rows[0]["VoucherNumber"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            WhenIAddHeaderWithToken(Token);

            WhenIInputVouchernumberData(VoucherNumber);
        }

        [When(@"I input the review")]
        public void WhenIInputTheReview(Table table)
        {
            string BookReference = table.Rows[0]["BookReference"].ToString();
            string AccuracyScore = table.Rows[0]["AccuracyScore"].ToString();
            string CommunicationScore = table.Rows[0]["CommunicationScore"].ToString();
            string CleanlinessScore = table.Rows[0]["CleanlinessScore"].ToString();
            string LocationScore = table.Rows[0]["LocationScore"].ToString();
            string ArrivalScore = table.Rows[0]["ArrivalScore"].ToString();
            string Review = table.Rows[0]["Review"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string UserId = WhenIAddHeaderWithToken(Token);

            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"UserId\": \""+ UserId + "\",  \"BookReference\": " + BookReference + ",  \"AccuracyScore\": " + AccuracyScore + ",  \"CommunicationScore\": " + CommunicationScore + ",  \"CleanlinessScore\": " + CleanlinessScore + ",  \"LocationScore\": " + LocationScore + ",  \"ArrivalScore\": " + ArrivalScore + ",  \"Review\": \"" + Review + "\"}");
        }

        [When(@"I input email setting")]
        public void WhenIInputEmailSetting(Table table)
        {
            //string JsonString = string.Empty;
            //JsonString = JsonConvert.SerializeObject(table);
            string json = JsonConvert.SerializeObject(table.Rows, Formatting.Indented);
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys(json);

        }

        [When(@"I input the recommendation")]
        public void WhenIInputTheRecommendation(Table table)
        {
            string listingId = table.Rows[0]["listingId"].ToString();
            string Message = table.Rows[0]["Message"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"ListingId\": "+ listingId +",  \"Message\": \""+ Message +"\"}");
        }

        [When(@"I input the recommendation for display")]
        public void WhenIInputTheRecommendationForDisplay(Table table)
        {
            string Offset = table.Rows[0]["Offset"].ToString();
            string Limit = table.Rows[0]["Limit"].ToString();
            string OrderBy = table.Rows[0]["OrderBy"].ToString();
            string OrderDirection = table.Rows[0]["OrderDirection"].ToString();
            string Lang = table.Rows[0]["Lang"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"Offset\": "+ Offset + ",  \"Limit\": " + Limit  + ",  \"OrderBy\": \"" + OrderBy + "\",  \"OrderDirection\": \"" + OrderDirection + "\",  \"Lang\": \"" + Lang + "\"}");
        }

        [When(@"I send the url ""(.*)""")]
        public void WhenISendTheUrl(string url)
        {
            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys(url);
        }

        [When(@"I open sent folder")]
        public void WhenIOpenSentFolder(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            string[] header = { "username", "password" };
            string[] row = { username, password };
            Table Token = new Table(header);
            Token.AddRow(row);
            string UserId = WhenIAddHeaderWithToken(Token);

            driver.FindElement(By.XPath("//input[2]")).Clear();
            driver.FindElement(By.XPath("//input[2]")).SendKeys("api/Messages/GetSent?SenderId=" + UserId);
        }

        [Then(@"the result should be ""(.*)""")]
        public void ThenTheResultShouldBe(string result)
        {
            string value = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            Assert.AreEqual(result, value);
        }

        [When(@"I input membership data update")]
        public void WhenIInputMembershipDataUpdate(Table table)
        {
            string active = table.Rows[0]["active"].ToString();
            string userId = table.Rows[0]["userId"].ToString();
            string inactiveReason = table.Rows[0]["inactiveReason"].ToString();
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"Active\": "+ active + ",  \"UserId\": \"" + userId + "\",  \"InActiveReason\": \"" + inactiveReason + "\"}");

        }

        [Then(@"""(.*)"" should be appear in result")]
        public void ThenShouldBeAppearInResult(string parameter)
        {
            string x = driver.FindElement(By.XPath("//div[3]/textarea")).GetAttribute("value");
            JToken token = JObject.Parse(x);
            string data = (string)token.SelectToken("Data[0]." + parameter);
            Assert.IsNotNull(data);
        }

        [When(@"I input paypal payment data")]
        public void WhenIInputPaypalPaymentData(Table table)
        {
            string PlanId = table.Rows[0]["PlanId"].ToString();
            string UserId = table.Rows[0]["UserId"].ToString();
            string TransactionId = table.Rows[0]["TransactionId"].ToString();   
            driver.FindElement(By.XPath("//textarea")).Clear();
            driver.FindElement(By.XPath("//textarea")).SendKeys("{  \"PlanId\": "+ PlanId + ",  \"UserId\": \"" + UserId + "\",  \"TransactionId\": \"" + TransactionId + "\"}");
        }

    }
}
