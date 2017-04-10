using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using System.Threading;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium.Interactions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium.Support;

namespace EHSTest
{
    [Binding]
    public sealed class testEHSt1Steps
    {
        IWebDriver driver;
        string xpath;

        [Given(@"I open the browser")]
        public void GivenIOpenTheBrowser()
        {
            driver = new FirefoxDriver();
            driver.Manage().Window.Maximize();
        }

        [Given(@"I navigate to the page ""(.*)""")]
        public void GivenINavigateToThePage(string url)
        {
            GivenIOpenTheBrowser();
            driver.Navigate().GoToUrl(url);
        }

        [When(@"I on header content")]
        public void WhenIOnHeaderContent()
        {
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));
            Assert.AreEqual("Educators Home Share", driver.FindElement(By.XPath("//h1")).Text);
        }

        [Then(@"I should see folowing menu:")]
        public void ThenIShouldSeeFolowingMenu(Table table)
        {
            string textMenu = table.Rows[0]["menu"].ToString();
            driver.FindElement(By.PartialLinkText(textMenu));
        }

        [Then(@"I should see the button ""(.*)""")]
        public void ThenIShouldSeeTheButton(string button)
        {
            Assert.AreEqual("Sign Up", driver.FindElement(By.XPath("//li[6]/a")).Text);
            driver.Close();
        }

        [Given(@"I login to the website")]
        public void GivenILoginToTheWebsite(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver = new FirefoxDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/sign-in");
            Thread.Sleep(5000);
            WhenICloseTheCookiesDisclimer();
            driver.FindElement(By.XPath("//div[2]/div/div/form/div/input")).SendKeys(username);
            driver.FindElement(By.XPath("//div[2]/div/div/form/div[2]/input")).SendKeys(password);
            driver.FindElement(By.XPath("//div[2]/div/div/form/center/button")).Click();
            Thread.Sleep(1000);
        }
        
        [Given(@"I go to profile page")]
        public void GivenIGoToProfilePage()
        {
            Thread.Sleep(5000);
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/profile");
        }

        [When(@"the profie page is loaded")]
        public void WhenTheProfiePageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("UserProfile", driver.FindElement(By.XPath("//ol")).Text);
        }

        [Then(@"I should see the missing field")]
        public void ThenIShouldSeeTheMissingField(Table table)
        {
            Thread.Sleep(5000);
            foreach (var row in table.Rows)
            {
                string title = row["title"].ToString();
                string field = row["field"].ToString();
                if(title == "Street address line 2")
                {
                    Assert.AreEqual(title, driver.FindElement(By.XPath("//div[3]/div/label")).Text);
                    driver.FindElement(By.Name(field));
                }
                else
                {
                    Assert.AreEqual(title, driver.FindElement(By.XPath("//div[4]/div/label")).Text);
                    driver.FindElement(By.Name(field));
                }
            }
        }

        [Given(@"I go to change password page")]
        public void GivenIGoToChangePasswordPage()
        {
            Thread.Sleep(5000);
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/change-password");
         }

        [When(@"the change password page is loaded")]
        public void WhenTheChangePasswordPageIsLoaded()
        {
            Thread.Sleep(10000);
            Assert.AreEqual("MemberChange Password", driver.FindElement(By.XPath("//ol")).Text);
        }

        [When(@"I change the password")]
        public void WhenIChangeThePassword(Table table)
        {
            string oldPassword = table.Rows[0]["oldPassword"].ToString();
            string newPassword = table.Rows[0]["newPassword"].ToString();
            string confirmationPassword = table.Rows[0]["confirmationPassword"].ToString();
            Thread.Sleep(10000);
            driver.FindElement(By.XPath("//form/div/div/input")).SendKeys(oldPassword);
            driver.FindElement(By.XPath("//form/div/div[2]/input")).SendKeys(newPassword);
            driver.FindElement(By.XPath("//div[3]/input")).SendKeys(confirmationPassword);
            driver.FindElement(By.XPath("//center/button")).Click();
            Thread.Sleep(1000);
        }

        [Then(@"I should see the pop-up message ""(.*)""")]
        public void ThenIShouldSeeThePop_UpMessage(string msg)
        {
            Thread.Sleep(500);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div[6]/div/div/p")).Text);
        }

        [Then(@"I should see old password error message ""(.*)""")]
        public void ThenIShouldSeeOldPasswordErrorMessage(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div/span")).Text);
        }
        
        [Then(@"I should see new password error message ""(.*)""")]
        public void ThenIShouldSeeNewPasswordErrorMessage(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div[2]/div/span")).Text);
        }

        [Then(@"I should see confrim password error message ""(.*)""")]
        public void ThenIShouldSeeConfrimPasswordErrorMessage(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div[3]/div/span")).Text);
        }

        [When(@"I click delete account button")]
        public void WhenIClickDeleteAccountButton()
        {
            Thread.Sleep(5000);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.XPath("//form/div/div/div/ul/li[3]/a"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            //driver.FindElement(By.XPath("//form/div/div/div/ul/li[3]/a")).Click();
        }

        [When(@"I input the password ""(.*)""")]
        public void WhenIInputThePassword(string password)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//input")).SendKeys(password);
            driver.FindElement(By.XPath("//button[2]")).Click();
        }

        [Then(@"I should see all fileds that profile page should have")]
        public void ThenIShouldSeeAllFiledsThatProfilePageShouldHave()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("", driver.FindElement(By.Id("profileImage")).Text);
            Assert.AreEqual("Upload photo", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div/ul/li/center/label")).Text);
            Assert.AreEqual("Change password", driver.FindElement(By.LinkText("Change password")).Text);
            Assert.AreEqual("Delete Account", driver.FindElement(By.LinkText("Delete Account")).Text);
            Assert.AreEqual("Username", driver.FindElement(By.XPath("//form/div/div/div[2]/div/label")).Text);
            Assert.AreEqual("First Name *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div[2]/div[2]/label")).Text);
            Assert.AreEqual("Last Name *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div[2]/div[3]/label")).Text);
            Assert.AreEqual("Phone Number", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div[2]/div[4]/label")).Text);
            Assert.AreEqual("Mobile Number *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div[2]/div[5]/label")).Text);
            Assert.AreEqual("Profile Description *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div/div/div[2]/div[6]/label")).Text);
            Assert.AreEqual("Email *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[2]/div/div/div/label")).Text);
            Assert.AreEqual("Confirm Your Email *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[2]/div/div/div[2]/label")).Text);
            Assert.AreEqual("Search location on Google *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div/div/label")).Text);
            Assert.AreEqual("Street address line 1 *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[2]/div/label")).Text);
            Assert.AreEqual("Street address line 2", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[3]/div/label")).Text);
            Assert.AreEqual("House Number", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[4]/div/label")).Text);
            Assert.AreEqual("Country *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[5]/div/div/label")).Text);
            Assert.AreEqual("State *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[5]/div[2]/div/label")).Text);
            Assert.AreEqual("City *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[6]/div/div/label")).Text);
            Assert.AreEqual("Zip Code *", driver.FindElement(By.XPath("//form[@id='editProfileForm']/div[3]/div/div[6]/div[2]/div/label")).Text);
            Assert.AreEqual("Preview", driver.FindElement(By.LinkText("Preview")).Text);
            Assert.AreEqual("Save Changes", driver.FindElement(By.XPath("//button[@type='submit']")).Text);
        }

        [When(@"I change the user profile")]
        public void WhenIChangeTheUserProfile(Table table)
        {
            Thread.Sleep(3000);
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string phoneNumber = table.Rows[0]["phoneNumber"].ToString();
            string mobileNumber = table.Rows[0]["mobileNumber"].ToString();
            string profileDescription = table.Rows[0]["profileDescription"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string searchLocation = table.Rows[0]["searchLocation"].ToString();
            string addressOne = table.Rows[0]["addressOne"].ToString();
            string addressTwo = table.Rows[0]["addressTwo"].ToString();
            string houseNumber = table.Rows[0]["houseNumber"].ToString();
            string country = table.Rows[0]["country"].ToString();
            string state = table.Rows[0]["state"].ToString();
            string city = table.Rows[0]["city"].ToString();
            string zipCode = table.Rows[0]["zipCode"].ToString();

            driver.FindElement(By.Id("FirstName")).Clear();
            driver.FindElement(By.Id("LastName")).Clear();
            driver.FindElement(By.Id("HomeNumber")).Clear();
            driver.FindElement(By.Id("MobileNumber")).Clear();
            driver.FindElement(By.Id("ProfileDescription")).Clear();
            driver.FindElement(By.Id("Email")).Clear();
            driver.FindElement(By.Id("ConfirmEmail")).Clear();
            driver.FindElement(By.Id("googleAutoComplete")).Clear();
            driver.FindElement(By.Id("UserAddress.AddressOne")).Clear();
            driver.FindElement(By.Id("UserAddress.AddressTwo")).Clear();
            driver.FindElement(By.Id("UserAddress.HouseNo")).Clear();
            driver.FindElement(By.Id("UserAddress.Province")).Clear();
            driver.FindElement(By.Id("UserAddress.City")).Clear();
            driver.FindElement(By.Id("UserAddress.PostalCode")).Clear();

            driver.FindElement(By.Id("FirstName")).SendKeys(firstName);
            driver.FindElement(By.Id("LastName")).SendKeys(lastName);
            driver.FindElement(By.Id("HomeNumber")).SendKeys(phoneNumber);
            driver.FindElement(By.Id("MobileNumber")).SendKeys(mobileNumber);
            driver.FindElement(By.Id("ProfileDescription")).SendKeys(profileDescription);
            driver.FindElement(By.Id("Email")).SendKeys(email);
            driver.FindElement(By.Id("ConfirmEmail")).SendKeys(email);
            driver.FindElement(By.Id("googleAutoComplete")).SendKeys(searchLocation);
            driver.FindElement(By.Id("UserAddress.AddressOne")).SendKeys(addressOne);
            driver.FindElement(By.Id("UserAddress.AddressTwo")).SendKeys(addressTwo);
            driver.FindElement(By.Id("UserAddress.HouseNo")).SendKeys(houseNumber);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.Id("UserAddress.Country.Name")));
            dropdown.SelectByText(country);
            Thread.Sleep(5000);
            driver.FindElement(By.Id("UserAddress.Province")).SendKeys(state);
            driver.FindElement(By.Id("UserAddress.City")).SendKeys(city);
            driver.FindElement(By.Id("UserAddress.PostalCode")).SendKeys(zipCode);
        }

        [Then(@"I click save")]
        public void ThenIClickSave()
        {
            driver.FindElement(By.XPath("//div[8]/div/button")).Click();
        }

        [Then(@"I should see the text on the pop-up")]
        public void ThenIShouldSeeTheTextOnThePop_Up(Table table)
        {
            Thread.Sleep(5000);
            foreach (var row in table.Rows)
            {
                string id = row["id"].ToString();
                string text = row["text"].ToString();
                if (id == "1")
                {
                    Assert.AreEqual(text, driver.FindElement(By.XPath("//h6")).Text);
                }
                else
                {
                    Assert.AreEqual(text, driver.FindElement(By.XPath("//label")).Text);
                }
            }
        }

        [Then(@"I should see the field password, cancel button and delete account button")]
        public void ThenIShouldSeeTheFieldPasswordCancelButtonAndDeleteAccountButton()
        {
            driver.FindElement(By.Id("Password"));
            Assert.AreEqual("Delete my account", driver.FindElement(By.XPath("//button[2]")).Text);
            Assert.AreEqual("Cancel", driver.FindElement(By.XPath("//div[3]/button")).Text);
        }

        [Given(@"I am on FE page ""(.*)""")]
        public void GivenIAmOnFEPage(string url)
        {
            GivenIOpenTheBrowser();
            driver.Navigate().GoToUrl(url);
        }

        [When(@"I click ""(.*)"" link")]
        public void WhenIClickLink(string link)
        {
            Thread.Sleep(5000);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.LinkText(link));
            js.ExecuteScript("arguments[0].click();", elementToClick);
        }

        [Then(@"I should see ""(.*)""label of pop-up detail")]
        public void ThenIShouldSeeLabelOfPop_UpDetail(string label)
        {
            Thread.Sleep(2000);
            string xpath;
            switch (label)
            {
                case "Small Modal Title":
                    xpath = "//h5";
                    break;
                case "Medium Modal Title":
                    xpath = "//div[2]/div/div/div/h5";
                    break;
                default:
                    xpath = "//div[3]/div/div/div/h5";
                    break;
            }
            Assert.AreEqual(label, driver.FindElement(By.XPath(xpath)).Text);
        }

        [Then(@"I should see the cancel button ""(.*)""")]
        public void ThenIShouldSeeTheCancelButton(string size)
        {
            string xpath;
            switch(size)
            {
                case "small":
                     xpath = "//div[3]/button";
                    break;
                case "medium":
                    xpath = "//div[2]/div/div/div[3]/button";
                    break;
                default:
                    xpath = "//div[3]/div/div/div[3]/button";
                    break;
            }

            Assert.AreEqual("Cancel", driver.FindElement(By.XPath(xpath)).Text);
        }

        [Then(@"I should see the yes button ""(.*)""")]
        public void ThenIShouldSeeTheYesButton(string size)
        {
            string xpath;
            switch (size)
            {
                case "small":
                    xpath = "//button[2]";
                    break;
                case "medium":
                    xpath = "//div[2]/div/div/div[3]/button[2]";
                    break;
                default:
                    xpath = "//div[3]/div/div/div[3]/button[2]";
                    break;
            }
            Assert.AreEqual("Yes, I'm Sure", driver.FindElement(By.XPath(xpath)).Text);
        }

        [Then(@"I  should see the close button ""(.*)""")]
        public void ThenIShouldSeeTheCloseButton(string size)
        {
            string xpath;
            switch (size)
            {
                case "small":
                    xpath = "//button";
                    break;
                case "medium":
                    xpath = "//div[2]/div/div/div/button";
                    break;
                default:
                    xpath = "//div[3]/div/div/div/button";
                    break;
            }
            Assert.AreEqual("×", driver.FindElement(By.XPath(xpath)).Text);
        }

        [When(@"edit the profile")]
        public void WhenEditTheProfile(Table table)
        {
            GivenIGoToProfilePage();
            WhenIChangeTheUserProfile(table);
            ThenIClickSave();
        }

        [Then(@"I go to profile page")]
        public void ThenIGoToProfilePage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/profile");
            Thread.Sleep(5000);
        }

        [Then(@"I should see ""(.*)"" in profile description field")]
        public void ThenIShouldSeeInProfileDescriptionField(string description)
        {
            Assert.AreEqual(description, driver.FindElement(By.Id("ProfileDescription")).GetAttribute("value"));
        }

        [When(@"open detail listing page")]
        public void WhenOpenDetailListingPage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/listing");
            Thread.Sleep(5000);
        }

        [Then(@"I should see the content")]
        public void ThenIShouldSeeTheContent(Table table)
        {
            foreach (var row in table.Rows)
            {
                string no = row["no"].ToString();
                string content = row["content"].ToString();
                string xpath;

                switch (no)
                {
                    case "1":
                        xpath = "//b";
                        break;
                    case "2":
                        xpath = "//form/div/div/div/div[2]/label";
                        break;
                   case "3":
                        xpath = "//div[2]/div/div/label";
                        break;
                    case "4":
                        xpath = "//form/div[3]/div/div/label";
                        break;
                    case "5":
                        xpath = "//div[2]/div[5]/div/div/label";
                        break;
                    case "6":
                        xpath = "//div[2]/div[5]/div[2]/div/label";
                        break;
                    case "7":
                        xpath = "//div[2]/div[6]/div/div/label";
                        break;
                    case "8":
                        xpath = "//div[2]/div[6]/div[2]/div/label";
                        break;
                    case "9":
                        xpath = "//div[3]/div/div[2]/div[2]/div/label";
                        break;
                    case "10":
                        xpath = "//div[7]";
                        break;
                    case "11":
                        xpath = "//div[4]/div/div/div/div/label";
                        break;
                    case "12":
                        xpath = "//div[4]/div/div[2]/div/div/label";
                        break;
                    case "13":
                        xpath = "//div[4]/div/div[2]/div[2]/div/label";
                        break;
                    case "14":
                        xpath = "//div[3]/div/div[2]/div/label";
                        break;
                    case "15":
                        xpath = "//div[3]/div[2]/div/div/label";
                        break;
                    case "16":
                        xpath = "//div[3]/div[3]/div[2]/div/label";
                        break;
                    default:
                        xpath = "//div[3]/div[4]/div/div/label";
                        break;
                }

                Assert.AreEqual(content, driver.FindElement(By.XPath(xpath)).Text.Trim());
            }
        }

        [When(@"open public profile with uername ""(.*)""")]
        public void WhenOpenPublicProfileWithUername(string username)
        {
            string url = "http://ehs.website-test.t1.voxteneo.com/#/public/" + username;
            driver.Navigate().GoToUrl(url);
            Thread.Sleep(5000);
        }

        [Then(@"I should see user information")]
        public void ThenIShouldSeeUserInformation()
        {
            driver.FindElement(By.XPath("//div/div/img"));
            Assert.AreEqual("lucubanget", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
            Assert.AreEqual("member since", driver.FindElement(By.XPath("//center/h6[2]")).Text);
            Assert.AreEqual("Facebook", driver.FindElement(By.XPath("//span[2]")).Text);
            Assert.AreEqual("Email", driver.FindElement(By.XPath("//div[2]/div/span[2]")).Text);
            Assert.AreEqual("School", driver.FindElement(By.XPath("//div[3]/div/span[2]")).Text);
            Assert.AreEqual("Profile Description", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("Contact Me", driver.FindElement(By.LinkText("Contact Me")).Text);
            Assert.AreEqual("Report", driver.FindElement(By.LinkText("Report")).Text);
        }

        [Then(@"I should see user listing information")]
        public void ThenIShouldSeeUserListingInformation()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Currently, lucubanget is not sharing his/her home", driver.FindElement(By.CssSelector("strong.ng-binding")).Text);
           // Assert.AreEqual("Currently, the availability dates are still undecided yet.", driver.FindElement(By.CssSelector("div.ng-scope > h6.font-grey-medium")).Text);
           // Assert.AreEqual("sample string 1", driver.FindElement(By.CssSelector("h4.ng-binding")).Text);
           // Assert.AreEqual("sample string 2", driver.FindElement(By.XPath("//div[2]/div/p")).Text);
           // Assert.AreEqual("Accommodates", driver.FindElement(By.CssSelector("span > b")).Text);
           // Assert.AreEqual("Bedroom", driver.FindElement(By.XPath("//div[2]/span/b")).Text);
           // Assert.AreEqual("Personal Car", driver.FindElement(By.CssSelector("span > b.ng-binding")).Text);
          //  Assert.AreEqual("Public Transportation", driver.FindElement(By.XPath("//div[2]/div/span/b")).Text);
        }

        [Then(@"I should see user review and recommendation")]
        public void ThenIShouldSeeUserReviewAndRecommendation()
        {
             Thread.Sleep(5000);
            Assert.AreEqual("Reviews and Recommendation", driver.FindElement(By.XPath("//div[2]/div/div/h4")).Text);
        }

        [When(@"I click ""(.*)"" tab")]
        public void WhenIClickTab(string linkText)
        {
            Thread.Sleep(5000);
            
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.LinkText(linkText));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            Thread.Sleep(3000);
        }

        [Then(@"I should see summary data of listing user")]
        public void ThenIShouldSeeSummaryDataOfListingUser()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Number of times Host has cancelled booking :", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div/div/span/b")).Text);
            Assert.AreEqual("Host booking has been cancelled by Others :", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div/div[2]/span/b")).Text);
            Assert.AreEqual("Host has hosted :", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[2]/div/span/b")).Text);
            Assert.AreEqual("Host has been hosted Others :", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[2]/div[2]/span/b")).Text);
            Assert.AreEqual("Overall Rating Score:", driver.FindElement(By.CssSelector("div.col-md-12.overall-rate > span > b")).Text);
            Assert.AreEqual("Accuracy", driver.FindElement(By.CssSelector("div.col-md-4 > p")).Text);
            Assert.AreEqual("Arrival", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[4]/div[2]/p")).Text);
            Assert.AreEqual("Communication", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[4]/div[3]/p")).Text);
            Assert.AreEqual("Cleanliness", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[4]/div[4]/p")).Text);
            Assert.AreEqual("Location", driver.FindElement(By.XPath("//div[@id='review-summary']/div/div[4]/div[5]/p")).Text);
        }
        [Then(@"I should see reviews of host data of listing user")]
        public void ThenIShouldSeeReviewsOfHostDataOfListingUser()
        {
            Assert.AreEqual("Reviews", driver.FindElement(By.XPath("//div[@id='review-for-host']/div/div/h6/b")).Text);
        }

        [Then(@"I should see reviews from host data of listing user")]
        public void ThenIShouldSeeReviewsFromHostDataOfListingUser()
        {
            Assert.AreEqual("Reviews", driver.FindElement(By.XPath("//div[@id='review-from-host']/div/div/h6/b")).Text);
        }

        [Then(@"I should see recommendations data of listing user")]
        public void ThenIShouldSeeRecommendationsDataOfListingUser()
        {
            Assert.AreEqual("Recommendations", driver.FindElement(By.XPath("//div[@id='review-recommendation']/div/div/h6/b")).Text);
        }

        [When(@"I click preview button")]
        public void WhenIClickPreviewButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText("Preview")).Click();
        }

        [Given(@"I go to listing page")]
        public void GivenIGoToListingPage()
        {
            Thread.Sleep(3000);
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/listing");
            Thread.Sleep(3000);
        }

        [When(@"I upload image")]
        public void WhenIUploadImage()
        {
            driver.FindElement(By.Id("file")).SendKeys("C:\\Users\\Voxteneo\\Downloads\\P_20160606_154419.jpg");
            Thread.Sleep(10000);
        }

        [When(@"I upload image ""(.*)""")]
        public void WhenIUploadImage(string file)
        {
            Thread.Sleep(2000);
            driver.FindElement(By.Id("file")).SendKeys(file);
        }

        [Then(@"I should see upload image error message")]
        public void ThenIShouldSeeUploadImageErrorMessage()
        {
            Thread.Sleep(1000);
            Assert.AreEqual("Maximum file size is 2 MB", driver.FindElement(By.XPath("//div[6]/div/div/p")).Text);
        }

        [Then(@"I should see the success message upload image")]
        public void ThenIShouldSeeTheSuccessMessageUploadImage()
        {
            driver.FindElement(By.XPath("//div[4]/div/div/div/img"));
        }

        [When(@"I click about us button")]
        public void WhenIClickAboutUsButton()
        {
            Thread.Sleep(5000);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.XPath("(//a[contains(text(),'About Us')])[2]"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
        }

        [When(@"about us page should be loaded")]
        public void WhenAboutUsPageShouldBeLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("About Us", driver.FindElement(By.XPath("//li[2]/span")).Text);
        }

        [Then(@"I should see the text")]
        public void ThenIShouldSeeTheText(Table table)
        {
            Thread.Sleep(5000);

            string titleXpath;
            string textXpath;
            foreach (var row in table.Rows)
            {
                string line = row["line"].ToString();
                string title = row["title"].ToString();
                string text = row["text"].ToString();

                switch (line)
                {
                    case "1":
                        titleXpath = "//div[2]/p/strong";
                        textXpath = "//div[2]/p";
                        break;
                    case "2":
                        titleXpath = "//p[2]/strong";
                        textXpath = "//p[2]";
                        break;
                    case "3":
                        titleXpath = "//p[3]/strong";
                        textXpath = "//p[3]";
                        break;
                    case "4":
                        titleXpath = "";
                        textXpath = "//div[2]/p";
                        break;
                    case "5":
                        titleXpath = "//div/strong";
                        textXpath = "//p[2]";
                        break;
                    case "6":
                        titleXpath = "//div[2]/strong";
                        textXpath = "//p[3]";
                        break;
                    default :
                        titleXpath = "//div[3]/strong";
                        textXpath = "//p[4]";
                        break;
                }

                
                if(titleXpath == "")
                {
                    Assert.AreEqual(text, driver.FindElement(By.XPath(textXpath)).Text);
                }
                else
                {
                    Assert.AreEqual(title, driver.FindElement(By.XPath(titleXpath)).Text);
                    Assert.AreEqual(text, driver.FindElement(By.XPath(textXpath)).Text);
                }
            }
        }

        [When(@"I click how it works button")]
        public void WhenIClickHowItWorksButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//div[2]/div/ul/li[3]/a")).Click();
        }

        [When(@"how it works page should be loaded")]
        public void WhenHowItWorksPageShouldBeLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("How It Works", driver.FindElement(By.XPath("//h3")).Text);
        }

        [When(@"I go to user page ""(.*)""")]
        public void WhenIGoToUserPage(string url)
        {
            Thread.Sleep(5000);
            driver.Navigate().GoToUrl(url);
        }

        [When(@"verification page should be loaded")]
        public void WhenVerificationPageShouldBeLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Verifications", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual("Verifications are important to ensure integrity and trust within the EHS Community.", driver.FindElement(By.CssSelector("b")).Text);
        }

        [Then(@"I should see the verification content page")]
        public void ThenIShouldSeeTheVerificationContentPage(Table table)
        {
            Thread.Sleep(5000);

            string titleXpath;
            string textXpath;
            string buttonXpath;
            foreach (var row in table.Rows)
            {
                string line = row["line"].ToString();
                string title = row["title"].ToString();
                string text = row["text"].ToString();
                string button = row["button"].ToString();

                switch (line)
                {
                    case "1":
                        titleXpath = "//h4";
                        textXpath = "//ul/div/p";
                        buttonXpath = "//li[2]/button";
                        break;
                    case "2":
                        titleXpath = "//div[2]/ul/li/h4";
                        textXpath = "//div[2]/ul/div/p";
                        buttonXpath = "//div[2]/ul/li[2]/button";
                        break;
                    default:
                        titleXpath = "//div[3]/ul/li/h4";
                        textXpath = "//div[3]/ul/div/p";
                        buttonXpath = "//div[3]/ul/li[2]/button";
                        break;
                }
                
                    Assert.AreEqual(title, driver.FindElement(By.XPath(titleXpath)).Text);
                    Assert.AreEqual(text, driver.FindElement(By.XPath(textXpath)).Text);
                    Assert.AreEqual(button, driver.FindElement(By.XPath(buttonXpath)).Text);
            }
        }

        [When(@"I click contact us button")]
        public void WhenIClickContactUsButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("(//a[contains(text(),'Contact Us')])[2]")).Click();
        }

        [When(@"contact us page should be loaded")]
        public void WhenContactUsPageShouldBeLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Contact Us", driver.FindElement(By.CssSelector("h3")).Text);
        }

        [Then(@"I should see the contact us content page")]
        public void ThenIShouldSeeTheContactUsContentPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Have a question? The answer may be in our Help section.", driver.FindElement(By.CssSelector("div.card.bg-white > h6")).Text);
            Assert.AreEqual("Want to email us? Please fill the form below and we will get back to you shortly.", driver.FindElement(By.XPath("//div/div/div/div/div/h6[2]")).Text);
            Assert.AreEqual("First Name *", driver.FindElement(By.CssSelector("div.form-group.col-sm-6 > label")).Text);
            Assert.AreEqual("Last Name *", driver.FindElement(By.XPath("//form/div/div[2]/label")).Text);
            Assert.AreEqual("Email *", driver.FindElement(By.CssSelector("div.form-group.col-sm-12 > label")).Text);
            Assert.AreEqual("How can we help you? *", driver.FindElement(By.XPath("//div[3]/div/label")).Text);
            Assert.AreEqual("Send Message", driver.FindElement(By.XPath("//center/button")).Text);
        }

        [Given(@"I sign up to the website")]
        public void GivenISignUpToTheWebsite(Table table)
        {
            GivenINavigateToThePage("http://ehs.website-test.t1.voxteneo.com/#/sign-up");
            Thread.Sleep(5000);
            string firstName = table.Rows[0]["firstName"].ToString();
            string lastName = table.Rows[0]["lastName"].ToString();
            string username = table.Rows[0]["username"].ToString();
            string email = table.Rows[0]["email"].ToString();
            string password = table.Rows[0]["password"].ToString();

            driver.FindElement(By.Name("FirstName")).SendKeys(firstName);
            driver.FindElement(By.Name("LastName")).SendKeys(lastName);
            driver.FindElement(By.Name("Username")).SendKeys(username);
            driver.FindElement(By.Name("Email")).SendKeys(email);
            driver.FindElement(By.Name("ConfirmEmail")).SendKeys(email);
            driver.FindElement(By.Name("Password")).SendKeys(password);
            driver.FindElement(By.Name("ConfirmPassword")).SendKeys(password);
           // driver.FindElement(By.Name("Terms")).Click();
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.Name("Terms"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            //driver.FindElement(By.XPath("//div[5]")).Click();
            Thread.Sleep(17000);
            //driver.FindElement(By.XPath("//center/button")).Click();
            Thread.Sleep(5000);
        }

        [When(@"I open the user email ""(.*)""")]
        public void WhenIOpenTheUserEmail(string email)
        {
            GivenINavigateToThePage("https://www.mailinator.com/");
            driver.FindElement(By.Id("inboxfield")).SendKeys(email);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.XPath("//span/button"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            //driver.FindElement(By.XPath("//span/button")).Click();
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//div[5]/div")).Click();
        }

        [Then(@"email verification content should be OK")]
        public void ThenEmailVerificationContentShouldBeOK(Table table)
        {
            Thread.Sleep(5000);
            string title = table.Rows[0]["title"].ToString();
            string text = table.Rows[0]["text"].ToString();
           // Assert.AreEqual(title, driver.FindElement(By.XPath("//h1")).Text);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.XPath("//h1"));
            Assert.AreEqual(title, js.ExecuteScript("arguments[0].text();", elementToClick));
            Assert.AreEqual(text, driver.FindElement(By.XPath("//body")).Text);
        }

        [Given(@"I am on sign-up page")]
        public void GivenIAmOnSign_UpPage()
        {
            GivenIOpenTheBrowser();
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/sign-up"); 
        }

        [When(@"sign-up page loaded")]
        public void WhenSign_UpPageLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Sign Up", driver.FindElement(By.CssSelector("h6.font-blue")).Text);
        }

        [Then(@"I should see the text content in sign-up page")]
        public void ThenIShouldSeeTheTextContentInSign_UpPage(Table table)
        {
            string title = table.Rows[0]["title"].ToString();
            string text = table.Rows[0]["text"].ToString();
            Assert.AreEqual(title, driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual(text, driver.FindElement(By.CssSelector("div.authentication-intro > p")).Text);
        }

        [Given(@"I upoad the image")]
        public void GivenIUpoadTheImage()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.Id("file")).SendKeys("C:\\Users\\Voxteneo\\Downloads\\o-PHILIPPINES-BEACH-facebook.jpg");
            Thread.Sleep(5000);
        }

        [When(@"I click delete image icon")]
        public void WhenIClickDeleteImageIcon()
        {
            Thread.Sleep(10000);
            //Actions action = new Actions(driver);
            //IWebElement we = driver.FindElement(By.CssSelector("button.icon-rounded.icon-red"));
            //action.MoveToElement(we);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.CssSelector("button.icon-rounded.icon-red"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            //driver.FindElement(By.CssSelector("button.icon-rounded.icon-red")).Click();
        }

        [When(@"I should see delete image verification pop-up")]
        public void WhenIShouldSeeDeleteImageVerificationPop_Up()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Delete Image", driver.FindElement(By.Id("exampleModalLabel")).Text);
        }

        [Then(@"I should see the success message delete image")]
        public void ThenIShouldSeeTheSuccessMessageDeleteImage()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[4]/div/div/div/img"));
        }

        [When(@"I click yes button on delete listing pop-up")]
        public void WhenIClickYesButtonOnDeleteListingPop_Up()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//button[2]")).Click();
        }

        [Then(@"I should see notification about cookies")]
        public void ThenIShouldSeeNotificationAboutCookies()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("We use cookies to ensure that we give you the best experience on our website. If you continue without changing your settings, we'll assume that you are happy to receive all cookies from this website. If you would like to change your preferences you may do so by following the instructions here", driver.FindElement(By.CssSelector("div.ns-box-inner > p")).Text);
        }

        [When(@"I go to homepage")]
        public void WhenIGoToHomepage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/");
            Thread.Sleep(5000);
        }

        [Then(@"I should at ""(.*)""")]
        public void ThenIShouldAt(string url)
        {
            Assert.AreEqual(url, driver.Url);
        }

        [Then(@"I should see the text to be included in home page")]
        public void ThenIShouldSeeTheTextToBeIncludedInHomePage(Table table)
        {
            Thread.Sleep(5000);
            int no = 0;
            foreach (var row in table.Rows)
            {
                string text = row["text"].ToString();
                switch (no){
                    case 0:
                        xpath = "//div/p";
                        break;
                    case 1:
                        xpath = "//b";
                        break;
                    case 2:
                        xpath = "//div/strong";
                        break;
                    case 3:
                        xpath = "//h3";
                        break;
                    case 4:
                        xpath = "//div[2]/div[2]/div/div/div/div/center/p";
                        break;
                    case 5:
                        xpath = "//div[2]/div[2]/div/div/div/div[2]/center/p";
                        break;
                    case 6:
                        xpath = "//div[3]/center/p";
                        break;
                    case 7:
                        xpath = "//div[3]/div/div/p";
                        break;
                    case 8:
                        xpath = "//div[4]/div/p";
                        break;
                    case 9:
                        xpath = "//div/div/div/div/div/h6";
                        break;
                    case 10:
                        xpath = "//div[2]/div/center/a";
                        break;
                    case 11:
                        xpath = "//div[5]/div/div/div/a";
                        break;
                    case 12:
                        xpath = "//div/div/div[2]/div/ul/li[3]/a";
                        break;
                    default:
                        break;
                }
                Assert.AreEqual(text, driver.FindElement(By.XPath(xpath)).Text);
                no++;
            }
        }

        [Then(@"I click the banner to verify the page that directed")]
        public void ThenIClickTheBannerToVerifyThePageThatDirected()
        {
            driver.FindElement(By.XPath("//a/div")).Click();
            Thread.Sleep(5000);
            Assert.AreEqual("http://ehs.website-test.t1.voxteneo.com/#/contact-us", driver.Url);
        }

        [When(@"I close the cookies disclimer")]
        public void WhenICloseTheCookiesDisclimer()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("span.ns-close")).Click();
        }

        [When(@"I click share listing radio button")]
        public void WhenIClickShareListingRadioButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//form/div/div/div/div/label/input")).Click();
        }

        [Then(@"I should see avalability section")]
        public void ThenIShouldSeeAvalabilitySection()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Availibility Dates", driver.FindElement(By.XPath("//h6/b")).Text);
        }

        [When(@"I click unshare listing radio button")]
        public void WhenIClickUnshareListingRadioButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//label[2]/input")).Click();
        }

        [Then(@"I shouldn't see avalability section")]
        public void ThenIShouldnTSeeAvalabilitySection()
        {
            Thread.Sleep(5000);
            Assert.AreNotEqual("Availibility Dates", driver.FindElement(By.XPath("//h6/b")).Text);
        }

        [Then(@"I should see pop-up notification tOne ""(.*)""")]
        public void ThenIShouldSeePop_UpNotificationTOne(string msg)
        {
            Thread.Sleep(2000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//body/div/div/div/div")).Text);
            driver.Close();
        }

        [When(@"home page is loaded")]
        public void WhenHomePageIsLoaded()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Educators Home Share", driver.FindElement(By.CssSelector("h1.wp1")).Text);
        }

        [Then(@"I should see the username in the header ""(.*)""")]
        public void ThenIShouldSeeTheUsernameInTheHeader(string lastName)
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Welcome "+lastName, driver.FindElement(By.CssSelector("a.dropdown-toggle.ng-binding")).Text);
        }

        [Given(@"I go to verification page")]
        public void GivenIGoToVerificationPage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/user/verifications");
            Thread.Sleep(5000);
        }

        [When(@"I click Send Email Verification")]
        public void WhenIClickSendEmailVerification()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//li[2]/button")).Click();
            Thread.Sleep(5000);
        }

        [When(@"I open the email ""(.*)"" and (.*)")]
        public void WhenIOpenTheEmailAnd(string email, int num)
        {
            driver.Navigate().GoToUrl("https://login.yahoo.com/");
            driver.FindElement(By.Id("login-username")).SendKeys(email);
            driver.FindElement(By.Id("login-signin")).Click();
            driver.FindElement(By.Id("login-passwd")).SendKeys("Bajang1010");
            driver.FindElement(By.Id("login-signin")).Click();
            Thread.Sleep(2000);
            driver.Navigate().GoToUrl("https://mg.mail.yahoo.com/");
            Thread.Sleep(2000);
            if(num == 1)
            {
                driver.FindElement(By.CssSelector("//div[4]/div/div[2]/div[2]/span")).Click();
            }
            else
            {
                driver.FindElement(By.XPath("//div[2]/span")).Click();
            }
        }


        [When(@"I should see the success message")]
        public void WhenIShouldSeeTheSuccessMessage()
        {
            Assert.AreNotEqual("The error occurs when sending mail.", driver.FindElement(By.CssSelector("div.ns-box-inner > p")).Text);
        }


        [Then(@"the email verification content should be Ok")]
        public void ThenTheEmailVerificationContentShouldBeOk()
        {
            Thread.Sleep(5000);
            var tinymce_frame = driver.FindElement(By.Id("publicshowmaildivcontent"));
            driver.SwitchTo().Frame(tinymce_frame);
            Assert.AreEqual("Email Verification", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello Kory", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("Thank you for joining the Educators Home Share community.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Please verify your email address by clicking on this link:", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Verified Your Email", driver.FindElement(By.LinkText("Verified Your Email")).Text);
            driver.SwitchTo().DefaultContent();
        }

        [Given(@"I go to school verification page")]
        public void GivenIGoToSchoolVerificationPage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/school-verification");
            Thread.Sleep(5000);
        }

        [Given(@"I input verification school data")]
        public void GivenIInputVerificationSchoolData(Table table)
        {
            string verSchoolName = table.Rows[0]["verSchoolName"].ToString();
            string verSchoolWebsite = table.Rows[0]["verSchoolWebsite"].ToString();
            string verSchoolAddress = table.Rows[0]["verSchoolAddress"].ToString();
            string verSchoolContact = table.Rows[0]["verSchoolContact"].ToString();
            string verContactPerson = table.Rows[0]["verContactPerson"].ToString();
            string verContactPersonNumber = table.Rows[0]["verContactPersonNumber"].ToString();
            string verContactEmail = table.Rows[0]["verContactEmail"].ToString();

            driver.FindElement(By.Id("VerSchoolName")).SendKeys(verSchoolName);
            driver.FindElement(By.Id("VerSchoolAddress")).SendKeys(verSchoolAddress);
            driver.FindElement(By.XPath("//div[5]/div/input")).SendKeys(verSchoolWebsite);
            driver.FindElement(By.XPath("//div[6]/div/input")).SendKeys(verSchoolContact);
            driver.FindElement(By.XPath("//div[7]/div/input")).SendKeys(verContactPersonNumber);
            driver.FindElement(By.Id("VerContactPerson")).SendKeys(verContactPerson);
            driver.FindElement(By.Id("VerContactEmail")).SendKeys(verContactEmail);
        }

        [When(@"I press ""(.*)"" button")]
        public void WhenIPressButton(string button)
        {
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText(button)).Click();
        }

        [Then(@"the school verification email should be ok")]
        public void ThenTheSchoolVerificationEmailShouldBeOk()
        {
            Assert.AreEqual("Educator Status Verification", driver.FindElement(By.XPath("//h1")).Text);
        }

        [Then(@"I should see message ""(.*)""")]
        public void ThenIShouldSeeMessage(string msg)
        {
            Thread.Sleep(1000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div[6]/div/div/p")).Text);
        }

        [Given(@"I close the cookies")]
        public void GivenICloseTheCookies()
        {
            driver.FindElement(By.CssSelector("span.ns-close")).Click();
        }

        [When(@"I go to school verification page")]
        public void WhenIGoToSchoolVerificationPage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/school-verification");
            Thread.Sleep(5000);
        }

        [Then(@"I should see the correct field on the page")]
        public void ThenIShouldSeeTheCorrectFieldOnThePage()
        {
            Assert.AreEqual("First Name", driver.FindElement(By.XPath("//form/div/div/label")).Text);
            Assert.AreEqual("Last Name", driver.FindElement(By.XPath("//form/div[2]/div/label")).Text);
            Assert.AreEqual("School Name", driver.FindElement(By.XPath("//div[3]/div/label")).Text);
            Assert.AreEqual("School Address", driver.FindElement(By.XPath("//div[4]/div/label")).Text);
            Assert.AreEqual("School Website Address", driver.FindElement(By.XPath("//div[5]/div/label")).Text);
            Assert.AreEqual("School Contact", driver.FindElement(By.XPath("//div[6]/div/label")).Text);
            Assert.AreEqual("Contact Person Phone Number", driver.FindElement(By.XPath("//div[7]/div/label")).Text);
            Assert.AreEqual("Contact Person Name", driver.FindElement(By.XPath("//div[8]/div/label")).Text);
            Assert.AreEqual("Contact Person Email Address who will Verify", driver.FindElement(By.XPath("//div[9]/div/label")).Text);
            Assert.AreEqual("Send Verification Request", driver.FindElement(By.XPath("//center/button")).Text);
        }
        
        [Then(@"I should see the correct content email ""(.*)""")]
        public void ThenIShouldSeeTheCorrectContentEmail(string header)
        {
            Assert.AreEqual(header, driver.FindElement(By.CssSelector("h1")).Text);
        }

        [Given(@"I open the email page")]
        public void GivenIOpenTheEmailPage()
        {
            GivenIOpenTheBrowser();
            driver.Navigate().GoToUrl("https://mg.mail.yahoo.com/neo/launch");
        }

        [When(@"I click verification")]
        public void WhenIClickVerification()
        {
            driver.FindElement(By.XPath("//div[2]/div/div/div/ul/li/a")).Click();
            Thread.Sleep(2000);
        }
        
        [Then(@"I should see verify message ""(.*)""")]
        public void ThenIShouldSeeVerifyMessage(string msg)
        {
            Thread.Sleep(2000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//h3")).Text);
        }

        [Then(@"I should see the school verification email")]
        public void ThenIShouldSeeTheSchoolVerificationEmail()
        {
            GivenIOpenTheEmailPage();
            driver.FindElement(By.XPath("//div[2]/div/div/div[2]/div/div[2]/div/div/div")).Click();
            Assert.AreEqual("Successful School Verification", driver.FindElement(By.XPath("//div[6]/div/div/div[2]/div/div[2]/div[2]/div/div/div/h1")).Text);
        }

        [Then(@"I should see the alert message")]
        public void ThenIShouldSeeTheAlertMessage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Please Extend Your Membership", driver.FindElement(By.Id("exampleModalLabel")).Text);
            Assert.AreEqual("You are applying for a booking with dates outside of your membership period. Please extend your membership plan by clicking Extend Membership button below or click Cancel to choose another listing.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cancel", driver.FindElement(By.CssSelector("button.btn.btn-default")).Text);
            Assert.AreEqual("Extend Membership", driver.FindElement(By.XPath("//button[2]")).Text);
        }

        [When(@"I click FE ""(.*)"" button")]
        public void WhenIClickFEButton(string button)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText(button)).Click();
        }

        [Then(@"I should see the content on the pop-up")]
        public void ThenIShouldSeeTheContentOnThePop_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("My Booking Request", driver.FindElement(By.XPath("//div[2]/div/div/div/h5")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.CssSelector("label")).Text);
            Assert.AreEqual("My Booking Date same with Availability Date", driver.FindElement(By.XPath("//div[2]/label")).Text);
            Assert.AreEqual("I have different Booking Date", driver.FindElement(By.XPath("//div[4]/label")).Text);
            Assert.AreEqual("Submit Booking", driver.FindElement(By.XPath("//div[2]/div/div/div[3]/button")).Text);
        }

        [Then(@"I should see the content of membership detail page")]
        public void ThenIShouldSeeTheContentOfMembershipDetailPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Membership", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("Current Membership Plan", driver.FindElement(By.CssSelector("label")).Text);
            Assert.AreEqual("Expired Date", driver.FindElement(By.XPath("//div[2]/div/label")).Text);
            Assert.AreEqual("Print to Excel", driver.FindElement(By.LinkText("Print to Excel")).Text);
            Assert.AreEqual("Extend Membership Now", driver.FindElement(By.LinkText("Extend Membership Now")).Text);
            Assert.AreEqual("Membership Plan", driver.FindElement(By.CssSelector("th")).Text);
            Assert.AreEqual("Period", driver.FindElement(By.XPath("//th[2]")).Text);
            Assert.AreEqual("Purchased Date", driver.FindElement(By.XPath("//th[3]")).Text);
            Assert.AreEqual("Cost", driver.FindElement(By.XPath("//th[4]")).Text);
            Assert.AreEqual("Exp. Date", driver.FindElement(By.XPath("//th[5]")).Text);
            Assert.IsNotNull(driver.FindElement(By.CssSelector("select.form-control")));
            Assert.IsNotNull(driver.FindElement(By.LinkText("3")));
        }

        [Then(@"I should see the content on the contact me pop-up")]
        public void ThenIShouldSeeTheContentOnTheContactMePop_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Contact Me", driver.FindElement(By.XPath("//div[2]/div/div/div/h5")).Text);
            Assert.AreEqual("Subject", driver.FindElement(By.XPath("//div[2]/div/div/div[2]/div/div/div/label")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.XPath("//div[2]/label")).Text);
            Assert.AreEqual("Send Message", driver.FindElement(By.XPath("//div[2]/div/div/div[3]/button")).Text);
        }

        [Then(@"I should see the content of admin user list page")]
        public void ThenIShouldSeeTheContentOfAdminUserListPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Users Users", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.IsNotNull(driver.FindElement(By.Name("q")));
            Assert.AreEqual("Country", driver.FindElement(By.CssSelector("label.col-sm-3.control-label")).Text);
            Assert.AreEqual("Member Since", driver.FindElement(By.XPath("//div[2]/label")).Text);
            Assert.AreEqual("Verification", driver.FindElement(By.CssSelector("label.col-md-3.control-label")).Text);
            Assert.AreEqual("Email", driver.FindElement(By.XPath("//div[2]/div/label")).Text);
            Assert.AreEqual("Facebook", driver.FindElement(By.XPath("//div[2]/div[2]/label")).Text);
            Assert.AreEqual("School", driver.FindElement(By.XPath("//div[3]/label")).Text);
            Assert.AreEqual("Username", driver.FindElement(By.XPath("//th/center")).Text);
            Assert.AreEqual("First Name", driver.FindElement(By.XPath("//th[2]/center")).Text);
            Assert.AreEqual("Last Name", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("Country", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual("Email Address", driver.FindElement(By.XPath("//th[5]/center")).Text);
            Assert.AreEqual("Registered Date", driver.FindElement(By.XPath("//th[6]/center")).Text);
            Assert.AreEqual("Verification", driver.FindElement(By.XPath("//th[7]/center")).Text);
            Assert.IsNotNull(driver.FindElement(By.XPath("//center/span/img")));
            Assert.IsNotNull(driver.FindElement(By.XPath("//center/span[2]/img")));
            Assert.IsNotNull(driver.FindElement(By.XPath("//span[3]/img")));  
            Assert.AreEqual("Action", driver.FindElement(By.XPath("//th[8]/center")).Text);
            Assert.IsNotNull(driver.FindElement(By.CssSelector("i.icon-eye")));
            Assert.IsNotNull(driver.FindElement(By.CssSelector("form.col-md-2 > select.form-control")));
            Assert.IsNotNull(driver.FindElement(By.LinkText("2")));
        }

        [Then(@"I should see the eamail content cancelling booking by guest member")]
        public void ThenIShouldSeeTheEamailContentCancellingBookingByGuestMember()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_FIRSTNAME}", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: Cancellation for {LISTING_TITLE} from {BOOK_BEG_DATE} to {BOOK_END_DATE}.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Cancellation From a Guest Member", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Cc: {Book_guest}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Oh no! {BOOK_GUEST} is cancelling a home share at your home. Here are the details:", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Guest members are made aware that various reservations and bookings are made ahead of time when planning a trip and for him/her to proceed with the cancellation may be that the reason behind this cancellation is serious, one that cannot be avoided.", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("{Content of personal message written by the guest – if no message was written, the sentence “The guest member has not written a personal message.” should be displayed.}", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("We do not take cancellations lightly. Whenever a cancellation is made, it gets recorded and displayed on personal profiles so that other members are aware of this fact. To have cancellations recorded on one’s profile reduces the chances of finding home sharing opportunities in the future.", driver.FindElement(By.XPath("//p[14]")).Text);
            Assert.AreEqual("If you have any question or concerns, drop us a note at info@educatorshomeshare.com", driver.FindElement(By.XPath("//p[15]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email content cancelling booking by host member")]
        public void ThenIShouldSeeTheEmailContentCancellingBookingByHostMember()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_FIRSTNAME}", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cancellation for {LISTING_TITLE} from {BOOK_BEG_DATE} to {BOOK_END_DATE}.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Cancellation From a Host Member", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Cc: {Book_guest}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Oh no! {BOOK_HOST} is cancelling a home share at his/her home. Here are the details:", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Host members are made aware that various reservations and bookings are made ahead of time when planning a trip and for him/her to proceed with the cancellation may be that the reason behind this cancellation is serious, one that cannot be avoided.", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("{Content of personal message written by the host – if no message was written, the sentence “The host member has not written a personal message.” should be displayed.}", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("We do not take cancellations lightly. Whenever a cancellation is made, it gets recorded and displayed on personal profiles so that other members are aware of this fact. To have cancellations recorded on one’s profile reduces the chances of finding home sharing opportunities in the future.", driver.FindElement(By.XPath("//p[14]")).Text);
            Assert.AreEqual("If you have any question or concerns, drop us a note at info@educatorshomeshare.com", driver.FindElement(By.XPath("//p[15]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of recommendation")]
        public void ThenIShouldSeeTheEmailOfRecommendation()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: User email", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {FRIEND_NAME}, {USER_FIRSTNAME} {USER_LASTNAME} would like a recommendation from you!", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Recommedation Letter Request", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {Friend-Name}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("{USER_FIRSTNAME} is a member of Educators Home Share, a website that caters to educators worldwide who choose to participate in home sharing experiences during their holidays. The EHS community builds its integrity and trust through a system of reviews, recommendations and verifications. These help other members decide with whom they choose to share their homes with. Members are encouraged to seek friends and family members to write some form of recommendation to build up the appeal of their personal profile. This is where you come in! We would be delighted if you chose to write something positive about {USER_FIRSTNAME}.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("If you choose to write this recommendation, please click on the following link which will lead you to the recommendation page of the Educators Home Share website: Write a Recommendation", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Thank you for your time. Should you also be an educator, we invite you to peruse our website to see how we can help you save on costs for your next holiday!", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of invite now")]
        public void ThenIShouldSeeTheEmailOfInviteNow()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: friend email", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {FRIEND_NAME}, {USER_FIRSTNAME} {USER_LASTNAME} thinks you might be interested!", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("{FRIEND_NAME}, Is Educators Home Share For You?", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("Hello {FRIEND_NAME}", driver.FindElement(By.XPath("//h2[2]")).Text);
            Assert.AreEqual("Allow us three guesses!", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("You are an educator", driver.FindElement(By.CssSelector("li")).Text);
            Assert.AreEqual("You travel and get to enjoy many holidays", driver.FindElement(By.XPath("//li[2]")).Text);
            Assert.AreEqual("You want to save on holiday costs whenever possible", driver.FindElement(By.XPath("//li[3]")).Text);
            Assert.AreEqual("If the above three guesses are true, then we understand why {USER_FIRSTNAME} invited you to visit and possibly join Educators Home Share.", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("If {USER_FIRSTNAME} chose to write a personal note before sending you this invitation, here it is:", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("{CONTENT of the personal message goes here. If the EHS user did not write any personal message, the following default sentence is displayed: ‘Your friend did not write a personal message before sending this invitation.’}", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("Educators Home Share is a website that offers educators worldwide a place where they can easily arrange home shares amongst each other. Visit our website and peruse some of our informative pages to get a better sense of how we can help you find the perfect home for your next holiday – all the while greatly reducing your holiday expenses.", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("That’s not all! If you decide to sign up, {USER_FIRSTNAME} gets to enjoy one extra free month on his/her membership! Cut and paste the info below and send it to us at admin@educatorshomeshare.com and we will give {USER_FIRSTNAME} that extra month once we check that you have signed up!", driver.FindElement(By.XPath("//p[14]")).Text);
            Assert.AreEqual("Please give one extra month of membership to:", driver.FindElement(By.XPath("//p[15]")).Text);
            Assert.AreEqual("EHS member’s name: {USER_FIRSTNAME} {USER_LASTNAME}", driver.FindElement(By.XPath("//li[4]")).Text);
            Assert.AreEqual("EHS member’s username: {USER_USERNAME}", driver.FindElement(By.XPath("//li[5]")).Text);
            Assert.AreEqual("My name: {FRIEND_NAME}", driver.FindElement(By.XPath("//li[6]")).Text);
            Assert.AreEqual("My email address: {FRIEND_EMAIL}", driver.FindElement(By.XPath("//li[7]")).Text);
            Assert.AreEqual("We hope to see you soon as an Educators Home Share member!", driver.FindElement(By.XPath("//p[24]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of voucher")]
        public void ThenIShouldSeeTheEmailOfVoucher()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, here is an EHS membership voucher for you!", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("A Voucher For You", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("At Educators Home Share, there are many ways members can get extra free months on their membership. Vouchers are used to allow members to claim this free membership extension. Here are the details for your membership voucher:", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Voucher number: VOUCH_NUM", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Voucher username or email: VOUCH_USERNAME", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Reason why this voucher is given to you: VOUCH_REASON", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Number of months this voucher extends your membership by: VOUCH_LENGTH", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Voucher needs to be claimed before: {need to put the date that is VOUCH_EXPIRY of months into the future}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Please make sure to claim your voucher before the expiry date as vouchers will not be extended or reissued. To claim your voucher, you need to do so in your EHS account dashboard. Claiming a voucher will automatically add the extra free time at the end of your current membership expiry date.", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("If you have any questions, don’t hesitate to contact us at info@educatorshomeshare.com.", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("Make the most of this extra membership time and find the perfect holiday spot for your next vacation!", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of welcome")]
        public void ThenIShouldSeeTheEmailOfWelcome()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Welcome to Educators Home Share", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Thank you for joining Educators Home Share! We are an online platform connecting educators worldwide who are looking for a different holiday experience.", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("What happens next?", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("1", driver.FindElement(By.XPath("//tr[4]/td/h1")).Text);
            Assert.AreEqual("Once your school verification has been successful, you will receive an email inviting you to fill out your profile information.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("2", driver.FindElement(By.XPath("//tr[5]/td/h1")).Text);
            Assert.AreEqual("Complete your profile!", driver.FindElement(By.XPath("//tr[5]/td/p")).Text);
            Assert.AreEqual("3", driver.FindElement(By.XPath("//tr[6]/td/h1")).Text);
            Assert.AreEqual("Search for and book your dream home share!", driver.FindElement(By.XPath("//tr[6]/td/p")).Text);
            Assert.AreEqual("If you are signing up as a result of having a friend recommend you join Educators Home Share, don’t forget to send us a note with your and your friend’s username so that we can give him/her a free extra one-month membership!", driver.FindElement(By.XPath("//tr[7]/td/p")).Text);
            Assert.AreEqual("If you have any questions or suggestions, please don’t hesitate to contact us at info@educatorshomeshare.com.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[8]/td/p")).Text);
        }

        [Then(@"I should see the email of incomplete profile")]
        public void ThenIShouldSeeTheEmailOfIncompleteProfile()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: User email", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: Your EHS personal profile remains incomplete!", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("You're Almost There..", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("We have noticed that your profile information remains incomplete since your school verification was successful. A completed and regularly updated profile plays a big role in the EHS community by adding credibility to you as a host or a guest. A completed profile also provides accurate information and enables members to get in touch with each other more efficiently. By showcasing who you are within our community, you are helping to build an environment of trust. Please take a few minutes to visit your dashboard and complete the required information that will show others that you are an active member of the EHS community.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Click on the following link to get going :", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Complete My Profile", driver.FindElement(By.LinkText("Complete My Profile")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of delete account")]
        public void ThenIShouldSeeTheEmailOfDeleteAccount()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: User email", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cc: Admin email", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Subject line of the email: EHS Account Deletion Confirmation.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Account Deletion Confirmation", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("This email is sent to acknowledge your request to delete your account (account username: {USERNAME}). Your account will be deleted from our database within the next 24 hours.", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("We are really sorry to see you go. We understand that there are many possible reasons to motivate someone to have their account deleted. If there is anything we can do to help, we would be happy to hear from you. Whether it is about an unresolved issue or sharing suggestions for us to improve our service, please don’t hesitate to contact us on info@educatorshomeshare.com. We welcome all feedback.", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Happy travels and we hope to welcome you back again soon!", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of account inactive for 3 months")]
        public void ThenIShouldSeeTheEmailOfAccountInactiveForMonths()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL}", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: It’s been a while! – Educators Home Share", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("It’s been a while!", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("It’s been a while since you last visited Educators Home Share. There has been a lot going on since you have been away with many new members joining our community each month. We continue to offer exciting destinations for you to consider for your next holiday.", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("Simply take another look and see what’s happening in the EHS community.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("In case you have forgotten your login details, help is available on the Sign In page or you can contact us at info@educatorshomeshare.com.", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("We look forward to you visiting soon!", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
        }

        [Then(@"I should see the email of reminder to riview for guest")]
        public void ThenIShouldSeeTheEmailOfReminderToRiviewForGuest()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the guest", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, you only have 4 days left to provide feedback!", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Your Feedback Is Important", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("This is a quick reminder to let you know that you only have 4 days left to write a review. Here are the details:", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("All feedback is important. Please take a few minutes to share your experience at the following link:", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
            Assert.AreEqual("{Link to the review OR response page, depending on where it is sent from}", driver.FindElement(By.LinkText("{Link to the review OR response page, depending on where it is sent from}")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[4]/td/p")).Text);
        }

        [Then(@"I should see the email of reminder to riview for host")]
        public void ThenIShouldSeeTheEmailOfReminderToRiviewForHost()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the host", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, you only have 4 days left to provide feedback!", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Your Feedback Is Important", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("This is a quick reminder to let you know that you only have 4 days left to write a review. Here are the details:", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("All feedback is important. Please take a few minutes to share your experience at the following link:", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
            Assert.AreEqual("{Link to the review OR response page, depending on where it is sent from}", driver.FindElement(By.LinkText("{Link to the review OR response page, depending on where it is sent from}")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[4]/td/p")).Text);
        }

        [Given(@"I am on search homes page")]
        public void GivenIAmOnSearchHomesPage()
        {
            Thread.Sleep(2000);
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/search");
            Thread.Sleep(2000);
        }

        [Given(@"I input search by location")]
        public void GivenIInputSearchByLocation(Table table)
        {
            string destination = table.Rows[0]["destination"].ToString();
            string DateFrom = table.Rows[0]["DateFrom"].ToString();
            string DateTo = table.Rows[0]["DateTo"].ToString();
            string Person = table.Rows[0]["Person"].ToString();
            driver.FindElement(By.LinkText("Location")).Click();
            Thread.Sleep(2000);

            driver.FindElement(By.XPath("//div/div/input")).SendKeys(destination);
            driver.FindElement(By.Id("DateFrom")).SendKeys(DateFrom);
            driver.FindElement(By.Id("DateTo")).SendKeys(DateTo);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//select")));
            dropdown.SelectByText(Person);
            Thread.Sleep(3000);
        }
        
        [When(@"I click search")]
        public void WhenIClickSearch()
        {
            //var button = driver.FindElement(By.XPath("//div[2]/button")).Displayed;
            if(driver.FindElement(By.XPath("//div[2]/button")).Displayed)
            {
                driver.FindElement(By.XPath("//div[2]/button")).Click();
            }
            else
            {
                driver.FindElement(By.XPath("//div/div[2]/button")).Click();
            }
            Thread.Sleep(3000);
        }

        [Then(@"I should see  the result of homes search")]
        public void ThenIShouldSeeTheResultOfHomesSearch(Table table)
        {
            string address = table.Rows[0]["address"].ToString();
            string userListing = table.Rows[0]["userListing"].ToString();

            Assert.AreEqual(userListing, driver.FindElement(By.CssSelector("b.ng-binding")).Text);
            //var test = driver.FindElement(By.XPath("//div/span[5]")).GetAttribute("innerHTML");
            if (IsElementPresent(By.XPath("//div/span[5]")))
            {
                Assert.AreEqual(address, driver.FindElement(By.XPath("//div/span[5]")).Text);
            }
            else
            {
                Assert.AreEqual(address, driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            }
        }

        private bool IsElementPresent(By by)
        {
            try
            {
                driver.FindElement(by);
                return true;
            }
            catch (NoSuchElementException)
            {
                return false;
            }
        }

        [Given(@"I click username tab")]
        public void GivenIClickUsernameTab()
        {
            driver.FindElement(By.LinkText("Username")).Click();
            Thread.Sleep(2000);
        }

        [Given(@"I input username ""(.*)""")]
        public void GivenIInputUsername(string username)
        {
            driver.FindElement(By.XPath("//div/div/div/input")).SendKeys(username);
            Thread.Sleep(2000);
        }

        [When(@"I click radio button for length of stay")]
        public void WhenIClickRadioButtonForLengthOfStay()
        {
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.Id("optionsRadios1"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
           // driver.FindElement(By.Id("optionsRadios1")).Click();
            Thread.Sleep(2000);
        }

        [When(@"I select (.*) days")]
        public void WhenISelectDays(string lengthOfStay)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[2]/select")));
            dropdown.SelectByText(lengthOfStay);
            Thread.Sleep(2000);
        }

        [Then(@"I should see the listing that have length of stay is same or more than (.*) days")]
        public void ThenIShouldSeeTheListingThatHaveLengthOfStayIsSameOrMoreThanDays(int lengthOfStay)
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("My lovely home in Bandung.", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
        }

        [When(@"I input number of bed room ""(.*)""")]
        public void WhenIInputNumberOfBedRoom(string bedroom)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[2]/div/select")));
            dropdown.SelectByText(bedroom);
            Thread.Sleep(5000);
        }

        [Then(@"I should see the listing that have ""(.*)"" bed room")]
        public void ThenIShouldSeeTheListingThatHaveBedRoom(string bedroom)
        {
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("My lovely home in Bandung.", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
            Assert.AreEqual("We have found 16 homes for your stay. The following listings are the closest match to your chosen criteria:", driver.FindElement(By.CssSelector("text.ng-binding.ng-scope")).Text);
        }

        [When(@"I input personal car feature ""(.*)""")]
        public void WhenIInputPersonalCarFeature(string feature)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[2]/div[2]/div/select")));
            dropdown.SelectByText(feature);
            Thread.Sleep(2000);
        }

        [Then(@"I should see the listing that have personal car is available for use")]
        public void ThenIShouldSeeTheListingThatHavePersonalCarIsAvailableForUse()
        {
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("Balinese house of your dreams", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
        }

        [When(@"I input public transportation feature ""(.*)""")]
        public void WhenIInputPublicTransportationFeature(string feature)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[3]/div/select")));
            dropdown.SelectByText(feature);
            Thread.Sleep(2000);
        }

        [Then(@"I should see the listing that have public transportation Available within a 15-minute walk")]
        public void ThenIShouldSeeTheListingThatHavePublicTransportationAvailableWithinA15_MinuteWalk()
        {
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("Balinese house of your dreams", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
        }

        [When(@"I input pet feature ""(.*)""")]
        public void WhenIInputPetFeature(string feature)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[4]/div/select")));
            dropdown.SelectByText(feature);
            Thread.Sleep(2000);
        }

        [Then(@"I should see the listing that have Caring for pets required")]
        public void ThenIShouldSeeTheListingThatHaveCaringForPetsRequired()
        {
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("My lovely home in Bandung.", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
        }

        [When(@"I input smoking feature ""(.*)""")]
        public void WhenIInputSmokingFeature(string feature)
        {
            Thread.Sleep(2000);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[5]/div/select")));
            dropdown.SelectByText(feature);
            Thread.Sleep(2000);
        }

        [Then(@"I should see the listing that Not allowed inside the house")]
        public void ThenIShouldSeeTheListingThatNotAllowedInsideTheHouse()
        {
            Assert.AreEqual("Bandung, Indonesia", driver.FindElement(By.CssSelector("span.listing-info.ng-binding")).Text);
            Assert.AreEqual("My lovely home in Bandung.", driver.FindElement(By.CssSelector("b.ng-binding")).Text);
        }

        [Then(@"I should see the email of booking accepted")]
        public void ThenIShouldSeeTheEmailOfBookingAccepted()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_MAIL} of the guest", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cc: {USER_EMAIL} of the host", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Subject line of the email: Booking request accepted for {LISTING_TITLE} from {BOOK_BEG_DATE} to {BOOK_END_DATE}.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Booking Request Accepted", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Cc: {Book_host}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("You’re set! {BOOK_HOST} has accepted your booking request for a home share. Here are the details:", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("To maximize the probability of a successful home share, make sure that you discuss the details of your upcoming experience with your host. A clear understanding of what is expected from both sides helps in reducing misunderstandings that can come up later on. In order to help you cover all the important points you can download the following agreement guidelines:", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Download Agreement Guidelines")).Displayed);
            Assert.AreEqual("Happy planning and happy travels!", driver.FindElement(By.XPath("//center/p")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of booking request")]
        public void ThenIShouldSeeTheEmailOfBookingRequest()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the host", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cc: {USER_EMAIL} of the guest", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Subject line of the email:Booking request for {LISTING_TITLE} from {BOOK_BEG_DATE} to {BOOK_END_DATE}.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Booking Request", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Cc: {Book_guest}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Great news! {BOOK_GUEST} has applied to experience a home share at your home. Here are the details:", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("The dates above may not match perfectly with the availability dates you entered in your listing. Make sure you check the desired dates above before you decide to approve this booking request.", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("Before accepting a booking, please be aware that:", driver.FindElement(By.XPath("//b")).Text);
            Assert.AreEqual("• It is preferable to message the guest member to make sure that he/she is still interested in home sharing with you – another request may have been approved while waiting for your reply, etc. We want to avoid cancelling bookings that are no longer desired.", driver.FindElement(By.XPath("//p[15]/b")).Text);
            Assert.AreEqual("• Cancellations should only ever be considered under compelling circumstances because plans and reservations may have been made.", driver.FindElement(By.XPath("//p[16]/b")).Text);
            Assert.AreEqual("To process this request, please click on the following link that leads you to the Share My Home page of your EHS profile:", driver.FindElement(By.XPath("//p[17]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("{Link to the Share My Home page of the user’s account}")).Displayed);
            Assert.AreEqual("It is best to provide feedback one way or another to all guest members who send you a booking request. Your reply does not have to take place now but closure of any kind allows guest members to plan their holidays more effectively.", driver.FindElement(By.XPath("//p[19]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email content declined booking")]
        public void ThenIShouldSeeTheEmailContentDeclinedBooking()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the guest", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cc: {USER_EMAIL} of the host", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Subject line of the email: Booking request declined for {LISTING_TITLE} from {BOOK_BEG_DATE} to {BOOK_END_DATE}.", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Booking Request Declined", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Cc: {Book_host}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Oh no! {BOOK_HOST} has declined the following home share request:", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("Host members can receive numerous emails for a single availability posting. It can become very time consuming to try to reply to every request personally which is why we created the possibility for hosts to simply click a button to inform a guest member that their request has been declined. Possible decline reasons are numerous: maybe the host has already accepted another guest for that availability, the dates requested don’t match with what the host requires, a lack of reviews in the guest’s profile may also be a reason to decline.", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("If you feel the need to contact the host member again, please do so through the Contact Me button on his/her personal profile page.", driver.FindElement(By.XPath("//p[14]")).Text);
            Assert.AreEqual("Continue searching and applying for home shares – your perfect spot is still waiting for you!", driver.FindElement(By.XPath("//p[15]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email content one week before a home stay")]
        public void ThenIShouldSeeTheEmailContentOneWeekBeforeAHomeStay()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the guest", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Cc: {USER_EMAIL} of the host", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Subject line of the email: Your home share is coming up in a week!", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Your home share adventure begins soon!", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Cc: {Book_host}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Your home share with {BOOK_HOST} is one week away! Hopefully, you have been able to communicate the details that will make your arrival and stay at your home share a wonderful experience.", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("Here is your booking information:", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[12]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("Have a great experience!", driver.FindElement(By.XPath("//p[14]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email content message inbox")]
        public void ThenIShouldSeeTheEmailContentMessageInbox()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL}", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: You have new messages in your EHS inbox.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("New Messages in Your EHS Inbox", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("This is an automatic email sent to inform you that you have new messages waiting to be read in your EHS inbox. Have a look – someone might be waiting to hear from you!", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you no longer want to receive this type of email:Update Email Preference", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
        }

        [Then(@"I should see the email content membership expiry 14 days")]
        public void ThenIShouldSeeTheEmailContentMembershipExpiryDays()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL}", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: Your EHS membership will expire in 14 days.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Your Membership Is Expiring Soon", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("This is a quick reminder that your Educators Home Share membership will expire in 14 days.", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("To extend your membership, please click on the following link:", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("{Link leading to the extend membership page}")).Displayed);
            Assert.AreEqual("Please don’t hesitate to contact us at info@educatorshomeshare.com if you have any questions, suggestions or concerns.", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
        }

        [Then(@"I should see the email content weekly listing update")]
        public void ThenIShouldSeeTheEmailContentWeeklyListingUpdate()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Here are some new home share listings from this week!", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("See More Listings")).Displayed);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you no longer want to receive this type of email:Update Email Preference", driver.FindElement(By.XPath("//p")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//p[2]")).Text);
        }

        [Then(@"I should see the email content response request for host \(user has completed a review\)")]
        public void ThenIShouldSeeTheEmailContentResponseRequestForHostUserHasCompletedAReview()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the host", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, here is your chance to respond to a guest review for {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Response Request", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("A guest has written a review about their experience in your home. This is your chance to respond to their review.", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("Here are some details related to your home share:", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("Reviews are a very important part of the EHS community. The feedback provided in these reviews and responses help inform guests in the planning of their trip and hosts in deciding whom to share their home with. Constructive reviews and responses enable hosts and guests to improve or change aspects of their home share experience if necessary. Please be fair and honest in your feedback. All reviews and responses are displayed on public profiles.", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
            Assert.AreEqual("Please click on the following link to complete your review:", driver.FindElement(By.XPath("//tr[3]/td/p[2]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("{Link that goes to the response page}")).Displayed);
            Assert.AreEqual("In order to keep feedback current and relevant, you have until {14 days in the future from the date the review was saved} (14 days from now) to complete your response. If needed, a reminder will be sent to you 4 days before that date.", driver.FindElement(By.XPath("//tr[3]/td/p[4]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[4]/td/p")).Text);
        }

        [Then(@"I should see the email content response request for host \(user doesn't write a review\)")]
        public void ThenIShouldSeeTheEmailContentResponseRequestForHostUserDoesnTWriteAReview()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the host", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, please comment on a stay from {BOOK_GUEST} at {BOOK_LISTTING_TITLE}", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Response Request", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {USER_FIRSTNAME}", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
            Assert.AreEqual("A guest has decided to not write a review about their experience in your home. This is your chance to comment on their stay if there are things you feel are important to share with the EHS community.", driver.FindElement(By.XPath("//tr[2]/td/p[2]")).Text);
            Assert.AreEqual("Here are some details related to your home share:", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("Guest: {BOOK_GUEST}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("Reviews are a very important part of the EHS community. The feedback provided in these reviews and responses help inform guests in the planning of their trip and hosts in deciding whom to share their home with. Constructive reviews and responses enable hosts and guests to improve or change aspects of their home share experience if necessary. Please be fair and honest in your feedback. All reviews and responses are displayed on public profiles.", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
            Assert.AreEqual("Please click on the following link to complete write your comments:", driver.FindElement(By.XPath("//tr[3]/td/p[2]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("{Link that goes to the response page}")).Displayed);
            Assert.AreEqual("In order to keep feedback current and relevant, you have until {14 days in the future from the date the link for the guest user was cancelled} (14 days from now) to complete your response. If needed, a reminder will be sent to you 4 days before that date.", driver.FindElement(By.XPath("//tr[3]/td/p[4]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[4]/td/p")).Text);
        }

        [Then(@"I should see read-only field for firstname and lastname")]
        public void ThenIShouldSeeRead_OnlyFieldForFirstnameAndLastname()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(false, driver.FindElement(By.Id("firstname")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.Id("lastname")).Enabled);
        }

        [Then(@"I should see the email of review request for guest")]
        public void ThenIShouldSeeTheEmailOfReviewRequestForGuest()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("To: {USER_EMAIL} of the guest", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject line of the email: {USER_FIRSTNAME}, please review your stay at {BOOK_LISTTING_TITLE}", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Review Request (Guest Member)", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {User-firstname}", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("We hope you enjoyed your home share experience. Here are some details related to your home share:", driver.FindElement(By.XPath("//p[4]")).Text);
            Assert.AreEqual("Booking reference: {BOOK_REF}", driver.FindElement(By.XPath("//p[5]")).Text);
            Assert.AreEqual("Listing title: {BOOK_LISTING_TITLE}", driver.FindElement(By.XPath("//p[6]")).Text);
            Assert.AreEqual("From: {BOOK_BEG_DATE}", driver.FindElement(By.XPath("//p[7]")).Text);
            Assert.AreEqual("To: {BOOK_END_DATE}", driver.FindElement(By.XPath("//p[8]")).Text);
            Assert.AreEqual("Host: {BOOK_HOST}", driver.FindElement(By.XPath("//p[9]")).Text);
            Assert.AreEqual("Reviews are a very important part of the EHS community. The feedback provided in these reviews help inform guests in the planning of their trip and hosts in deciding whom to share their home with. Constructive reviews enable hosts and guests to improve or change aspects of their home share experience if necessary. Please be fair and honest in your feedback. All reviews and responses are displayed on public profiles.", driver.FindElement(By.XPath("//p[10]")).Text);
            Assert.AreEqual("Please click on the following link to complete your review:", driver.FindElement(By.XPath("//p[11]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("{Link that goes to the review page}")).Displayed);
            Assert.AreEqual("In order to keep feedback current and relevant, you have until {14 days in the future from the current date} (14 days from now) to complete your review. If needed, a reminder will be sent to you 4 days before that date.", driver.FindElement(By.XPath("//p[13]")).Text);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[2]/td/p")).Text);
        }

        [Then(@"I should see the email of verification when sign-up")]
        public void ThenIShouldSeeTheEmailOfVerificationWhenSign_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Email Verification", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {{Username}}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("Thank you for joining the Educators Home Share community.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Please verify your email address by clicking on this link:", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Verified Your Email")).Displayed);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
        }

        [Then(@"I should see the email of verification when change email")]
        public void ThenIShouldSeeTheEmailOfVerificationWhenChangeEmail()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Email Verification", driver.FindElement(By.CssSelector("h1")).Text);
            Assert.AreEqual("Hello {{Username}}", driver.FindElement(By.CssSelector("h2")).Text);
            Assert.AreEqual("You have recently changed your email address in your Educators Home Share account.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Please verify your new email address by clicking on this link:", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Verified Your Email")).Displayed);
            Assert.AreEqual("The Educators Home Share Team", driver.FindElement(By.CssSelector("h5")).Text);
            Assert.AreEqual("Follow us on", driver.FindElement(By.XPath("//h5[2]")).Text);
            Assert.AreEqual("If you have any questions or sugestions:Contact Us", driver.FindElement(By.XPath("//tr[3]/td/p")).Text);
        }

        [Then(@"I should see read-only for all fields on confrim booking")]
        public void ThenIShouldSeeRead_OnlyForAllFieldsOnConfrimBooking()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Confirm Booking", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual(false, driver.FindElement(By.Id("ref")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.Id("booking-date")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//form/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Back To List")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Confirm Booking")).Displayed);
        }

        [When(@"I press list icon")]
        public void WhenIPressListIcon()
        {
            Thread.Sleep(5000);
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.Id("list"));
            js.ExecuteScript("arguments[0].click();", elementToClick);
            //driver.FindElement(By.Id("list")).Click();
        }

        [Then(@"I should see informative result")]
        public void ThenIShouldSeeInformativeResult()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Personal Car - May be available for use", driver.FindElement(By.XPath("//div[2]/div/div/div[2]/span")).Text);
            Assert.AreEqual("Public Transportation - Not Available", driver.FindElement(By.XPath("//div/div/div[3]/span")).Text);
            Assert.AreEqual("Pets - No caring for pets required", driver.FindElement(By.XPath("//div[4]/span")).Text);
            Assert.AreEqual("Smoking - Not allowed inside the house", driver.FindElement(By.XPath("//div[5]/span")).Text);
        }

        [Then(@"all link should be correct")]
        public void ThenAllLinkShouldBeCorrect(Table table)
        {
            Thread.Sleep(5000);
            int count = 1;
            foreach (var row in table.Rows)
            {
                string country = row["country"].ToString();
                string link = row["link"].ToString();
                if (count == 1)
                {
                    Assert.AreEqual("Name: " + country, driver.FindElement(By.XPath("//div[2]/div/div/div/div[2]/p")).Text);
                    Assert.AreEqual(link, driver.FindElement(By.XPath("//p[2]/a")).GetAttribute("href"));
                }
                else
                {
                    Assert.AreEqual("Name: " + country, driver.FindElement(By.XPath("//div["+ count +"]/div/div/div[2]/p")).Text);
                    Assert.AreEqual(link, driver.FindElement(By.XPath("//div[" + count + "]/div/div/div[2]/p[2]/a")).GetAttribute("href"));
                }
                count++;
            }
        }

        [Then(@"I should see user dashboard")]
        public void ThenIShouldSeeUserDashboard()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("http://ehs.website-test.t1.voxteneo.com/#/user", driver.Url);
        }

        [Then(@"I should see choose a plan page")]
        public void ThenIShouldSeeChooseAPlanPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("http://ehs.website-test.t1.voxteneo.com/#/choose-plan", driver.Url);
        }

        [Then(@"I should see verification school page")]
        public void ThenIShouldSeeVerificationSchoolPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("http://ehs.website-test.t1.voxteneo.com/#/school-verification", driver.Url);
        }

        [Then(@"I should see extend membership notification message")]
        public void ThenIShouldSeeExtendMembershipNotificationMessage()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("In order to regain full access to your account, please extend your membership by choosing one of the available plans. Members must have an active membership to enjoy the services provided by Educators Home Share, such as booking arrangements, reviews, etc.", driver.FindElement(By.CssSelector("div.ns-box-inner > p")).Text);
        }

        [Then(@"I should see correct decline pop-up content")]
        public void ThenIShouldSeeCorrectDeclinePop_UpContent()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Decline Booking", driver.FindElement(By.Id("exampleModalLabel")).Text);
            Assert.AreEqual("Are you sure you want to decline this booking request?", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("No", driver.FindElement(By.CssSelector("button.btn.btn-default")).Text);
            Assert.AreEqual("Yes", driver.FindElement(By.XPath("//button[2]")).Text);
        }

        [When(@"I click yes button on decline booking pop-up")]
        public void WhenIClickYesButtonOnDeclineBookingPop_Up()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//button[2]")).Click();
        }

        [Then(@"the listing should be disappear")]
        public void ThenTheListingShouldBeDisappear()
        {
            Thread.Sleep(5000);
            Assert.AreNotEqual("test", driver.FindElement(By.XPath("//div[2]/div/div/div/div[2]/p")).Text);
        }

        [Then(@"the data should appear in decline booking tab")]
        public void ThenTheDataShouldAppearInDeclineBookingTab()
        {
            WhenIClickTab("Declined Bookings");
            Thread.Sleep(5000);
            Assert.AreEqual("test", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div[2]/div/div/div/div[2]/p")).Text);
        }

        [Then(@"the content of booking request should be OK")]
        public void ThenTheContentOfBookingRequestShouldBeOK()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Booking Requests")).Displayed);
            Assert.AreEqual("Ref#", driver.FindElement(By.XPath("//div/span")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.XPath("//div[2]/div/div/span")).Text);
            Assert.AreEqual("Booking From", driver.FindElement(By.XPath("//div[3]/div/div/span")).Text);
            Assert.AreEqual("Booking To", driver.FindElement(By.XPath("//div[4]/div/div/span")).Text);
            Assert.AreEqual("Choose One Option", driver.FindElement(By.XPath("//div[5]/div/div/span")).Text);
            Assert.AreEqual("Show entries", driver.FindElement(By.XPath("//div[2]/div/p")).Text);
        }

        [Then(@"the content of accept booking should be OK")]
        public void ThenTheContentOfAcceptBookingShouldBeOK()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Accepted Bookings")).Displayed);
            Assert.AreEqual("Ref#", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div/div/div/span")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div[2]/div/div/span")).Text);
            Assert.AreEqual("Booking From", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div[3]/div/div/span")).Text);
            Assert.AreEqual("Booking To", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div[4]/div/div/span")).Text);
            Assert.AreEqual("Status", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div[5]/div/div/span")).Text);
            Assert.AreEqual("Action", driver.FindElement(By.XPath("//div[2]/div/div/div/div/div/div/div/div/div/div/div/div[6]/div/div/span")).Text);
            Assert.AreEqual("Show entries", driver.FindElement(By.XPath("//div[2]/div[2]/div/p")).Text);
        }

        [Then(@"the content of decline booking should be OK")]
        public void ThenTheContentOfDeclineBookingShouldBeOK()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Declined Bookings")).Displayed);
            Assert.AreEqual("Ref#", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div/div/div/div/div/div/div/div/div/span")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div/div/div/div/div/div/div[2]/div/div/span")).Text);
            Assert.AreEqual("Booking From", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div/div/div/div/div/div/div[3]/div/div/span")).Text);
            Assert.AreEqual("Booking To", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div/div/div/div/div/div/div[4]/div/div/span")).Text);
            Assert.AreEqual("Status", driver.FindElement(By.XPath("//div[3]/div/div/div/div/div/div/div/div/div/div/div/div[5]/div/div/span")).Text);
            Assert.AreEqual("Show entries", driver.FindElement(By.XPath("//div[3]/div[2]/div/p")).Text);
        }

        [Then(@"I should see the content of expred membership notification")]
        public void ThenIShouldSeeTheContentOfExpredMembershipNotification()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("In order to regain full access to your dashboard, please extend your membership by choosing one of the available plans. Members must have an active membership to enjoy the services provided by Educators Home Share, such as booking arrangements, reviews, etc.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Your Membership Has Expired", driver.FindElement(By.CssSelector("h4.font-red")).Text);
            Assert.AreEqual("Buy a Plan", driver.FindElement(By.XPath("//label")).Text);
        }

        [Then(@"I should see the content of cancel sharing other home")]
        public void ThenIShouldSeeTheContentOfCancelSharingOtherHome()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Cancellation of Home Stay", driver.FindElement(By.Id("exampleModalLabel")).Text);
            Assert.AreEqual("You are about to cancel a home stay booking that has previously been accepted by the Host. Cancellations (or change of dates) should only ever be done under compelling circumstances, such as serious illness or injury, death or natural disaster. The Host member may have made plans and reservations based on your commitment, so if you are forced to cancel or change the agreement, you should make every effort to help the host resolve problems that may arise as a result of your cancellation.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("All cancellations are recorded and displayed on the public profile of members.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("textarea.form-control")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.CssSelector("input.form-control")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[7]/div/input")).Enabled);
            Assert.AreEqual("Cancel", driver.FindElement(By.XPath("//div[3]/button")).Text);
            Assert.AreEqual("Continue", driver.FindElement(By.XPath("//button[2]")).Text);
        }

        [Then(@"I should see the content of cancel accpeted booking pop-up")]
        public void ThenIShouldSeeTheContentOfCancelAccpetedBookingPop_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Cancellation of Home Stay", driver.FindElement(By.XPath("//div[3]/div/div/div/h5")).Text);
            Assert.AreEqual("You are about to cancel a home stay booking that has previously been accepted by you. Cancellations (or change of dates) should only ever be done under compelling circumstances, such as serious illness or injury, death or natural disaster. The Guest member may have made plans and reservations based on your commitment, so if you are forced to cancel or change the agreement, you should make every effort to accommodate or find accommodations for the Guest member you are cancelling on.", driver.FindElement(By.XPath("//div/p")).Text);
            Assert.AreEqual("All cancellations are recorded and displayed on the public profile of members.", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("textarea.form-control")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.CssSelector("input.form-control")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[7]/div/input")).Enabled);
            Assert.AreEqual("Cancel", driver.FindElement(By.XPath("//div[3]/div/div/div[3]/button")).Text);
            Assert.AreEqual("Continue", driver.FindElement(By.XPath("//div[3]/div/div/div[3]/button[2]")).Text);
        }

        [Then(@"I should see the content of update avaliability pop-up")]
        public void ThenIShouldSeeTheContentOfUpdateAvaliabilityPop_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Remaining Availability Dates", driver.FindElement(By.Id("exampleModalLabel")).Text);
            Assert.AreEqual("We found that availability dates that there are some dates not covered by the dates of this booking request - the current booking accepted may only cover a small portion of the availability range you initially posted.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Information Remaining Availability Dates:", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.CssSelector("input.form-control")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/input")).Enabled);
            Assert.AreEqual("You could add the availability dates in your \"My Listing\" page.", driver.FindElement(By.CssSelector("i")).Text);
            Assert.AreEqual("OK", driver.FindElement(By.XPath("//div[3]/button")).Text);
        }

        [Then(@"I should see the content of inbox not opened page")]
        public void ThenIShouldSeeTheContentOfInboxNotOpenedPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Inbox", driver.FindElement(By.XPath("//ol/li[3]")).Text);
            Assert.AreEqual("Inbox", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual(true, driver.FindElement(By.Name("q")).Enabled);
            Assert.AreEqual("08 September 2016", driver.FindElement(By.CssSelector("p.date-messages")).Text);
            Assert.AreEqual("StormTrooper", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual("Subject", driver.FindElement(By.CssSelector("div.font-blue")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.XPath("//div[3]/span")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("button.btn-archive.ion-ios-box")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("button.btn-trash.ion-ios-trash")).Enabled);
            Assert.AreEqual("09/08/16", driver.FindElement(By.XPath("//div[3]/span[2]")).Text);
        }

        [Then(@"I should see the content of inbox opened page")]
        public void ThenIShouldSeeTheContentOfInboxOpenedPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Inbox", driver.FindElement(By.XPath("//ol/li[3]")).Text);
            Assert.AreEqual("Inbox", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("Tonystark", driver.FindElement(By.XPath("//div[2]/div/h5")).Text);
            Assert.AreEqual("Subject: Lorem Ipsum Dolor", driver.FindElement(By.XPath("//li/p")).Text);
            Assert.AreEqual("To: Darthvader", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Date: 8 September 2016", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Lorem ipsum dolor sit amet, ne his admodum scaevola consectetuer, dico saepe molestie et eum, dolorem appellantur qui no. Vis saperet delectus postulant ea, eu lorem paulo apeirian pro. Ea nec ferri mazim efficiantur, ex pro alia vocent audire. Nec vitae option ea. Te vim tantas adipisci. Legere constituto no has. An case perpetua nec, tincidunt consequuntur ea qui. Eu dicant postulant salutatus cum, ad omnium blandit conclusionemque nam, alii minim aliquid sed id. Brute tritani diceret id eum, amet dicat convenire cu mel, no partem mucius comprehensam usu. Reque commodo adversarium in mel, veniam nemore ne mei, an partiendo mediocritatem usu. Utinam reprehendunt ut mei, eam duis tation expetendis no, dicant putent possit usu ex.", driver.FindElement(By.CssSelector("div.col-md-12 > p")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//center/a")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Delete")).Enabled);
        }

        [Then(@"I should see the content of archive page")]
        public void ThenIShouldSeeTheContentOfArchivePage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Archive", driver.FindElement(By.XPath("//ol/li[3]")).Text);
            Assert.AreEqual("Archive", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("Tonystark", driver.FindElement(By.XPath("//div[2]/div/h5")).Text);
            Assert.AreEqual("Subject: Lorem Ipsum Dolor", driver.FindElement(By.XPath("//li/p")).Text);
            Assert.AreEqual("To: Darthvader", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Date: 8 September 2016", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Lorem ipsum dolor sit amet, ne his admodum scaevola consectetuer, dico saepe molestie et eum, dolorem appellantur qui no. Vis saperet delectus postulant ea, eu lorem paulo apeirian pro. Ea nec ferri mazim efficiantur, ex pro alia vocent audire. Nec vitae option ea. Te vim tantas adipisci. Legere constituto no has. An case perpetua nec, tincidunt consequuntur ea qui. Eu dicant postulant salutatus cum, ad omnium blandit conclusionemque nam, alii minim aliquid sed id. Brute tritani diceret id eum, amet dicat convenire cu mel, no partem mucius comprehensam usu. Reque commodo adversarium in mel, veniam nemore ne mei, an partiendo mediocritatem usu. Utinam reprehendunt ut mei, eam duis tation expetendis no, dicant putent possit usu ex.", driver.FindElement(By.CssSelector("div.col-md-12 > p")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//center/a")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Delete")).Enabled);
        }

        [Then(@"I should see the content of trash page")]
        public void ThenIShouldSeeTheContentOfTrashPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Trash", driver.FindElement(By.XPath("//ol/li[3]")).Text);
            Assert.AreEqual("Trash", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual("Tonystark", driver.FindElement(By.XPath("//div[2]/div/h5")).Text);
            Assert.AreEqual("Subject: Lorem Ipsum Dolor", driver.FindElement(By.XPath("//li/p")).Text);
            Assert.AreEqual("To: Darthvader", driver.FindElement(By.XPath("//p[2]")).Text);
            Assert.AreEqual("Date: 8 September 2016", driver.FindElement(By.XPath("//p[3]")).Text);
            Assert.AreEqual("Lorem ipsum dolor sit amet, ne his admodum scaevola consectetuer, dico saepe molestie et eum, dolorem appellantur qui no. Vis saperet delectus postulant ea, eu lorem paulo apeirian pro. Ea nec ferri mazim efficiantur, ex pro alia vocent audire. Nec vitae option ea. Te vim tantas adipisci. Legere constituto no has. An case perpetua nec, tincidunt consequuntur ea qui. Eu dicant postulant salutatus cum, ad omnium blandit conclusionemque nam, alii minim aliquid sed id. Brute tritani diceret id eum, amet dicat convenire cu mel, no partem mucius comprehensam usu. Reque commodo adversarium in mel, veniam nemore ne mei, an partiendo mediocritatem usu. Utinam reprehendunt ut mei, eam duis tation expetendis no, dicant putent possit usu ex.", driver.FindElement(By.CssSelector("div.col-md-12 > p")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Delete")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Clear All Trash")).Enabled);
        }

        [Then(@"I should see the content of edit user personal info \(profile tab\)")]
        public void ThenIShouldSeeTheContentOfEditUserPersonalInfoProfileTab()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div/img")).Displayed);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//textarea")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/div[2]/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Back to List")).Enabled);
        }

        [Then(@"I should see the content of edit user personal info \(listing tab\)")]
        public void ThenIShouldSeeTheContentOfEditUserPersonalInfoListingTab()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Currently, Username is sharing His/Her Home", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual("User can still list their home to share even if they are undecided about they dates of availability", driver.FindElement(By.XPath("//p/i")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/div/div/input")).Enabled);
            Assert.AreEqual("Availibility Dates", driver.FindElement(By.XPath("//h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//label/input")).Enabled);
            Assert.AreEqual("Username availbility dates are undecided at this time", driver.FindElement(By.XPath("//div[2]/div[2]/div[2]/div/label")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[2]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[4]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[4]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div[3]/div/select")).Enabled);
            Assert.AreEqual("Listing Address", driver.FindElement(By.XPath("//div[3]/h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/label/input")).Enabled);
            Assert.AreEqual("Same as Username Personal Address", driver.FindElement(By.XPath("//section[2]/div/div/div[2]/div[2]/div[3]/div/label")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/label/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[4]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.CssSelector("span.error")).Displayed);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual("Listing Details", driver.FindElement(By.XPath("//div[4]/h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/div/div/textarea")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[4]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/div/div/textarea")).Enabled);
            Assert.AreEqual("Listing Photos", driver.FindElement(By.XPath("//h6[2]/b")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/div/div/img")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/div/a")).Enabled);
        }

        [Then(@"I should see the content of edit user personal info \(verification tab\)")]
         public void ThenIShouldSeeTheContentOfEditUserPersonalInfoVerificationTab()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//form/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//form/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//form/div[3]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[4]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[7]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[8]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[9]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[10]/div/div[2]/a")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Save Changes")).Enabled);
        }

        [Then(@"I should see the content of edit user personal info \(reviews and recommendations tab\)")]
        public void ThenIShouldSeeTheContentOfEditUserPersonalInfoReviewsAndRecommendationsTab()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Reviews", driver.FindElement(By.CssSelector("h4")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/form/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/form/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/form/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/form/div[4]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/form/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[4]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[4]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//section[2]/div/div/div[2]/div[4]/div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//section[2]/div/div/div[2]/div[4]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[6]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[6]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[7]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[7]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[8]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[8]/div[2]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//form/div/div/div/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//form/div/div/div/div/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[4]/button")).Enabled);
            Assert.AreEqual("Search", driver.FindElement(By.XPath("//div[4]/button")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//form/select")).Enabled);
            Assert.AreEqual("From", driver.FindElement(By.XPath("//th/center")).Text);
            Assert.AreEqual("Review", driver.FindElement(By.XPath("//th[2]/center")).Text);
            Assert.AreEqual("Response", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("Date", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div/nav")).Enabled);
            Assert.AreEqual("Recommendations", driver.FindElement(By.XPath("//div[13]/h4")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[14]/form/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[15]/form/div/div/div/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[15]/form/div/div/div/div/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[15]/form/div/div/div/div/div[4]/button")).Enabled);
            Assert.AreEqual("Search", driver.FindElement(By.XPath("//div[15]/form/div/div/div/div/div[4]/button")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[16]/form/select")).Enabled);
            Assert.AreEqual("From", driver.FindElement(By.XPath("//div[17]/table/thead/tr/th/center")).Text);
            Assert.AreEqual("Review", driver.FindElement(By.XPath("//div[17]/table/thead/tr/th[2]")).Text);
            Assert.AreEqual("Response", driver.FindElement(By.XPath("//div[17]/table/thead/tr/th[3]/center")).Text);
            Assert.AreEqual("Date", driver.FindElement(By.XPath("//div[17]/table/thead/tr/th[4]/center")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[18]/div/nav")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[19]/div/div/a")).Enabled);
            Assert.AreEqual("Back to List", driver.FindElement(By.XPath("//div[19]/div/div/a")).Text);
        }

        [Then(@"I should see the content of edit user personal info \(testimonial and membership tab\)")]
        public void ThenIShouldSeeTheContentOfEditUserPersonalInfoTestimonialAndMembershipTab()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Testimonial", driver.FindElement(By.XPath("//div[5]/div/h4")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div[2]/div/textarea")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[2]/div[2]/div/input")).Enabled);
            Assert.AreEqual("Membership", driver.FindElement(By.XPath("//div[3]/h4")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//form/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//form/div/div[2]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div[5]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[4]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[5]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/form/div/div/div/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/form/div/div/div/div/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/div/div[2]/button")).Enabled);
            Assert.AreEqual("Search", driver.FindElement(By.XPath("//div[6]/div/div/div[2]/button")).Text);
            Assert.AreEqual("Membership Plan", driver.FindElement(By.XPath("//div[8]/table/thead/tr/th/center")).Text);
            Assert.AreEqual("Period", driver.FindElement(By.XPath("//div[8]/table/thead/tr/th[2]/center")).Text);
            Assert.AreEqual("Purchased Date", driver.FindElement(By.XPath("//div[8]/table/thead/tr/th[3]/center")).Text);
            Assert.AreEqual("Cost", driver.FindElement(By.XPath("//div[8]/table/thead/tr/th[4]/center")).Text);
            Assert.AreEqual("Expired Date", driver.FindElement(By.XPath("//th[5]/center")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div/nav")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div[10]/div/div/a")).Enabled);
            Assert.AreEqual("Back to List", driver.FindElement(By.XPath("//div[5]/div[10]/div/div/a")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//a[2]")).Enabled);
            Assert.AreEqual("Save Changes", driver.FindElement(By.XPath("//a[2]")).Text);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Print to Excel")).Enabled);
        }

        [When(@"I click Listings tab")]
        public void WhenIClickListingsTab()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//div/ul/li[2]/a")).Click();
        }

        [Then(@"I should see the content of edit user listing info")]
        public void ThenIShouldSeeTheContentOfEditUserListingInfo()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Currently, Username is sharing His/Her Home", driver.FindElement(By.CssSelector("b")).Text);
            Assert.AreEqual("User can still list their home to share even if they are undecided about they dates of availability", driver.FindElement(By.XPath("//p/i")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/div/div/input")).Enabled);
            Assert.AreEqual("Availibility Dates", driver.FindElement(By.XPath("//h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//label/input")).Enabled);
            Assert.AreEqual("Username availbility dates are undecided at this time", driver.FindElement(By.XPath("//div[2]/div/label")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[2]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[4]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[4]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[5]/div[3]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[6]/div[3]/div/select")).Enabled);
            Assert.AreEqual("Listing Address", driver.FindElement(By.XPath("//div[3]/h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/label/input")).Enabled);
            Assert.AreEqual("Same as Username Personal Address", driver.FindElement(By.XPath("//section[2]/div/div/div[3]/div/label")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div/label/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[2]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div[3]/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[4]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[5]/div/div/input")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div[5]/div[2]/div/input")).Enabled);
            Assert.AreEqual("Listing Details", driver.FindElement(By.XPath("//div[4]/h6/b")).Text);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/div/div/textarea")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[3]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[3]/div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[4]/div/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div[2]/div/select")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[4]/div/div/div/textarea")).Enabled);
            Assert.AreEqual("Listing Photos", driver.FindElement(By.XPath("//h6[2]/b")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/div/div/img")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/div/a")).Enabled);
        }

        [Then(@"I should see the content of admin accounting page")]
        public void ThenIShouldSeeTheContentOfAdminAccountingPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Admin Accounting", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual("Accounting Summary", driver.FindElement(By.CssSelector("label.col-sm-2.control-label")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/input")).Enabled);
            Assert.AreEqual("Search", driver.FindElement(By.XPath("//button")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//button")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Export to PDF")).Enabled);
            Assert.AreEqual("Username", driver.FindElement(By.XPath("//th/center")).Text);
            Assert.AreEqual("Membership Plan", driver.FindElement(By.XPath("//th[2]")).Text);
            Assert.AreEqual("Expired Date", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("Total Fee", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual("«\r\n1\r\n2\r\n3\r\n4\r\n5\r\n»", driver.FindElement(By.CssSelector("nav.pull-right")).Text);
            Assert.AreEqual("5\r\n10\r\n20\r\n50\r\n100", driver.FindElement(By.CssSelector("select.form-control")).Text);
        }

        [Then(@"I should see the missing button in create voucher page")]
        public void ThenIShouldSeeTheMissingButtonInCreateVoucherPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("span.reload-voucher-icon.ion-ios-loop")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("select.form-control")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/select")).Displayed);
        }

        [Then(@"I should see the content of admin manage membership page")]
        public void ThenIShouldSeeTheContentOfAdminManageMembershipPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Membership", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("select.form-control")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[2]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[7]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[7]/div/div[2]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[8]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[8]/div/div[2]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[9]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[9]/div/div[2]/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[10]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[10]/div/div[2]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[2]/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[11]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[11]/div/div[2]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[11]/div/div[2]/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[12]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[12]/div/div[2]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[12]/div/div[2]/div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Print to Excel")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Reset")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Search")).Enabled);
            Assert.AreEqual("5\r\n10\r\n20\r\n50\r\n100", driver.FindElement(By.XPath("//form/select")).Text);
            Assert.AreEqual(true, driver.FindElement(By.Name("q")).Enabled);
            Assert.AreEqual("Member", driver.FindElement(By.XPath("//th/center")).Text);
            Assert.AreEqual("Membership Plan", driver.FindElement(By.XPath("//th[2]/center")).Text);
            Assert.AreEqual("Member Since", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("From", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual("Booking", driver.FindElement(By.XPath("//th[5]/center")).Text);
            Assert.AreEqual("Accepted Booking", driver.FindElement(By.XPath("//th[6]/center")).Text);
            Assert.AreEqual("Overall Rating", driver.FindElement(By.XPath("//th[7]//center")).Text);
            Assert.AreEqual("Status", driver.FindElement(By.XPath("//th[8]/center")).Text);
            Assert.AreEqual("«\r\n1\r\n2\r\n3\r\n4\r\n5\r\n»", driver.FindElement(By.CssSelector("nav.pull-right")).Text);
        }

        [Then(@"I should see the content of admin user listing page")]
        public void ThenIShouldSeeTheContentOfAdminUserListingPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Listings", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("select.form-control")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("input.form-control")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[4]/div/select")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[6]/div/div/div/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[7]/div/div/label/input")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[2]/label/input")).Enabled);
            Assert.AreEqual("Search", driver.FindElement(By.XPath("//button")).Text);
            Assert.AreEqual("show entries\r\n5\r\n10\r\n20\r\n50\r\n100", driver.FindElement(By.CssSelector("form.col-md-2")).Text);
            Assert.AreEqual(true, driver.FindElement(By.Name("q")).Enabled);
            Assert.AreEqual("Username", driver.FindElement(By.XPath("//th/center")).Text);
            Assert.AreEqual("Share Status", driver.FindElement(By.XPath("//th[2]/center")).Text);
            Assert.AreEqual("Listing Title", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("From", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual("Availability Dates", driver.FindElement(By.XPath("//th[5]/center")).Text);
            Assert.AreEqual("Action", driver.FindElement(By.XPath("//th[6]/center")).Text);
            Assert.AreEqual("«\r\n1\r\n2\r\n3\r\n4\r\n5\r\n»", driver.FindElement(By.CssSelector("nav.pull-right")).Text);
        }

        [Then(@"I should see the content of report pop-up")]
        public void ThenIShouldSeeTheContentOfReportPop_Up()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Report", driver.FindElement(By.Id("exampleModalLabel")).Text);
            Assert.AreEqual("Thank you for your concern. Please tell us what content you feel is inappropriate in this profile. Rest assured that your anonymity will be respected at all times.", driver.FindElement(By.CssSelector("p")).Text);
            Assert.AreEqual("Subject", driver.FindElement(By.CssSelector("label")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("input.form-control")).Enabled);
            Assert.AreEqual("Message", driver.FindElement(By.CssSelector("label")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("textarea.form-control")).Enabled);
            Assert.AreEqual("Send Report", driver.FindElement(By.CssSelector("//div[3]/button")).Text);
        }

        [Then(@"I should see the content of print list to pdf in Admin Accounting page")]
        public void ThenIShouldSeeTheContentOfPrintListToPdfInAdminAccountingPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Admin Accounting", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual("Username", driver.FindElement(By.CssSelector("center")).Text);
            Assert.AreEqual("Membership Plan", driver.FindElement(By.XPath("//th[2]/center")).Text);
            Assert.AreEqual("Expired Date", driver.FindElement(By.XPath("//th[3]/center")).Text);
            Assert.AreEqual("Total Fee", driver.FindElement(By.XPath("//th[4]/center")).Text);
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("div.admin-content")).Displayed);
        }

        [Then(@"I should see the picture profile and username  in sharing other's home page")]
        public void ThenIShouldSeeThePictureProfileAndUsernameInSharingOtherSHomePage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//td[2]/div/img")).Displayed);
            Assert.IsNotNull(driver.FindElement(By.CssSelector("b")));
        }

        [Then(@"I should see the correct listing grammar in listing menu bar")]
        public void ThenIShouldSeeTheCorrectListingGrammarInListingMenuBar()
        {
            Thread.Sleep(2000);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Sharing Other's Home")).Displayed);
        }

        [When(@"I click sharing my home menu")]
        public void WhenIClickSharingMyHomeMenu()
        {
            driver.FindElement(By.XPath("//li[4]/ul/li[2]/a")).Click();
            Thread.Sleep(2000);
        }

        [Then(@"I should see the correct grammar in tab menu")]
        public void ThenIShouldSeeTheCorrectGrammarInTabMenu()
        {
            Thread.Sleep(2000);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Booking Requests")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Accepted Bookings")).Displayed);
            Assert.AreEqual(true, driver.FindElement(By.LinkText("Declined Bookings")).Displayed);
        }

        [Then(@"I should see the sorting icon in sharing my home page")]
        public void ThenIShouldSeeTheSortingIconInSharingMyHomePage()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[2]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
            driver.FindElement(By.XPath("//div[3]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
            driver.FindElement(By.XPath("//div[4]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
        }

        [Then(@"I should see sorting icon in saharing other's home page")]
        public void ThenIShouldSeeSortingIconInSaharingOtherSHomePage()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div[2]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
            driver.FindElement(By.XPath("//div[3]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
            driver.FindElement(By.XPath("//div[4]/div/div/span")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
            driver.FindElement(By.XPath("//div[5]/div/div")).Click();
            Assert.AreEqual(true, driver.FindElement(By.CssSelector("i.ui-grid-icon-up-dir")).Displayed);
        }

        [Then(@"the required field should not be empty")]
        public void ThenTheRequiredFieldShouldNotBeEmpty()
        {
            Thread.Sleep(2000);
            Assert.AreNotEqual("", driver.FindElement(By.Id("MobileNumber")).GetAttribute("value"));
            Assert.AreNotEqual("", driver.FindElement(By.Id("ProfileDescription")).GetAttribute("value"));
            Assert.AreNotEqual("", driver.FindElement(By.Id("googleAutoComplete")).GetAttribute("value"));
        }

        [Then(@"I shouldn't see the text ""(.*)""")]
        public void ThenIShouldnTSeeTheText(string text)
        {
            Thread.Sleep(2000);
            Assert.AreNotEqual(text, driver.FindElement(By.CssSelector("p")).Text);
        }

        [Then(@"I should correct text of delete account pop-up ""(.*)""")]
        public void ThenIShouldCorrectTextOfDeleteAccountPop_Up(string text)
        {
            Thread.Sleep(2000);
            Assert.AreEqual(text, driver.FindElement(By.CssSelector("h6")).Text);
        }

        [Then(@"the password form should be empty")]
        public void ThenThePasswordFormShouldBeEmpty()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("", driver.FindElement(By.Id("Password")).Text);
        }

        [When(@"I click profile menu")]
        public void WhenIClickProfileMenu()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div/div/div/div/div/ul/li[2]/a")).Click();
        }

        [When(@"click public profile sub menu")]
        public void WhenClickPublicProfileSubMenu()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//li[2]/ul/li[2]/a")).Click();
        }

        [Then(@"I should see the message ""(.*)"" in public profile page")]
        public void ThenIShouldSeeTheMessageInPublicProfilePage(string text)
        {
            Thread.Sleep(2000);
            Assert.AreEqual(text, driver.FindElement(By.XPath("//div[2]/div/div/div/div/p")).Text);
        }

        [Then(@"the grammar of public profile page should be correct")]
        public void ThenTheGrammarOfPublicProfilePageShouldBeCorrect()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Verifications", driver.FindElement(By.XPath("//div[2]/div/h6/b")).Text);
            Assert.AreEqual("Reviews and Recommendations", driver.FindElement(By.XPath("//div[4]/div/div/h4")).Text);
        }

        [Then(@"I should see 5 destination")]
        public void ThenIShouldSeeDestination(Table table)
        {
            Thread.Sleep(5000);
            int count = 1;
            string xpath;
            foreach (var row in table.Rows)
            {
                string country = row["country"].ToString();
                if (count == 1)
                {
                    xpath = "//h2";
                }
                else
                {
                    xpath = "//div[" + count + "]/div/div/h2";
                }

                Assert.AreEqual(country, driver.FindElement(By.XPath(xpath)).Text);
                count++;
            }
        }

        [Then(@"I should see list of sharing other home")]
        public void ThenIShouldSeeListOfSharingOtherHome(Table table)
        {
            Thread.Sleep(5000);
            int count = 1;

            foreach (var row in table.Rows)
            {
                string BookRef = row["BookRef"].ToString();
                string Username = row["Username"].ToString();
                string Message = row["Message"].ToString();
                string BookingFrom = row["BookingFrom"].ToString();
                string BookingTo = row["BookingTo"].ToString();
                string BookingStatus = row["BookingStatus"].ToString();

                if (count == 1)
                {
                    Assert.AreEqual(BookRef, driver.FindElement(By.XPath("//div/div/div/div/div/div[2]/div/div/div/div/div")).Text);
                    Assert.AreEqual(Username, driver.FindElement(By.XPath("//p/b")).Text);
                    Assert.AreEqual(Message, driver.FindElement(By.XPath("//p[2]")).Text);
                    Assert.AreEqual(BookingFrom, driver.FindElement(By.XPath("//div[2]/div/div/div/div[3]/div")).Text);
                    Assert.AreEqual(BookingTo, driver.FindElement(By.XPath("//div[2]/div/div/div/div[4]/div")).Text);
                    Assert.AreEqual(BookingStatus, driver.FindElement(By.XPath("//div[2]/div/div/div/div[5]/div")).Text);
                }
                else
                {
                    Assert.AreEqual(BookRef, driver.FindElement(By.XPath("//div[2]/div/div[2]/div/div/div")).Text);
                    Assert.AreEqual(Username, driver.FindElement(By.XPath("//div[2]/div/div[2]/div/div[2]/p/b")).Text);
                    Assert.AreEqual(Message, driver.FindElement(By.XPath("//div[2]/div/div[2]/div/div[2]/p[2]")).Text);
                    Assert.AreEqual(BookingFrom, driver.FindElement(By.XPath("//div[2]/div/div[3]/div")).Text);
                    Assert.AreEqual(BookingTo, driver.FindElement(By.XPath("//div[2]/div/div[4]/div")).Text);
                    Assert.AreEqual(BookingStatus, driver.FindElement(By.XPath("//div[2]/div/div[5]/div")).Text);
                }
                count++;
            }
        }

        [When(@"I click the listing")]
        public void WhenIClickTheListing()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.CssSelector("img.ng-scope")).Click();
        }

        [Then(@"I should see correct content")]
        public void ThenIShouldSeeCorrectContent()
        {
            Assert.AreEqual("My Booking Request", driver.FindElement(By.CssSelector("h5.modal-title.font-blue")).Text);
            Assert.AreEqual("Message", driver.FindElement(By.CssSelector("label")).Text);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//textarea")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//div[2]/label")).Enabled);
            Assert.AreEqual(false, driver.FindElement(By.XPath("//i")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[2]/span/div/span/i")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[4]/label")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div/span/div/span/i")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[5]/div[2]/span/div/span/i")).Enabled);
            Assert.AreEqual(true, driver.FindElement(By.XPath("//div[3]/button")).Enabled);
        }

        [When(@"I press apply now button ""(.*)""")]
        public void WhenIPressApplyNowButton(int num)
        {
            Thread.Sleep(3000);
            string xpath;
            switch (num)
            {
                case 2: xpath = "//div[2]/div/div[3]/center/a";
                    break;
                case 3: xpath = "//div[3]/div/div[3]/center/a";
                    break;
                default: xpath = "";
                    break;
            }
           // driver.FindElement(By.XPath(xpath)).Click();
            IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
            var elementToClick = driver.FindElement(By.XPath(xpath));
            js.ExecuteScript("arguments[0].click();", elementToClick);
        }

        [When(@"Input apply booking data")]
        public void WhenInputApplyBookingData(Table table)
        {
            string message = table.Rows[0]["message"].ToString();
            string IhaveDifferentBookingDate = table.Rows[0]["IhaveDifferentBookingDate"].ToString();
            string dateFrom = table.Rows[0]["dateFrom"].ToString();
            string dateTo = table.Rows[0]["dateTo"].ToString();

            driver.FindElement(By.XPath("//textarea")).SendKeys(message);
            driver.FindElement(By.XPath("//div[4]/label")).Click();
            driver.FindElement(By.Name("differentStartData")).SendKeys(message);
            driver.FindElement(By.Name("differentEndDate")).SendKeys(message);
        }

        [When(@"I click submit booking button")]
        public void WhenIClickSubmitBookingButton()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div[3]/button")).Click();
        }

        [When(@"Input message for apply booking data ""(.*)""")]
        public void WhenInputMessageForApplyBookingData(string message)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div[2]/label")).Click();
            driver.FindElement(By.XPath("//textarea")).SendKeys(message);
        }

    }
}
