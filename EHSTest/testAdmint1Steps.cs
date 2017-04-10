using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using System.Threading;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EHSTest
{
    [Binding]
    public sealed class testAdmint1Steps
    {
        IWebDriver driver;

        [Given(@"I open the driver")]
        public void GivenIOpenTheDriver()
        {
            driver = new FirefoxDriver();
        }

        [Given(@"I am on manage news admin page ""(.*)""")]
        public void GivenIAmOnManageNewsAdminPage(string url)
        {
            Thread.Sleep(5000);
            driver.Navigate().GoToUrl(url);
        }

        [Given(@"the Manage News page is loaded")]
        public void GivenTheManageNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("latest news of Educators Home Share", driver.FindElement(By.XPath("//h3/small")).Text);
        }

        [When(@"I click ""(.*)"" button")]
        public void WhenIClickButton(string button)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText(button)).Click();
        }

        [Given(@"the Add News page is loaded")]
        public void GivenTheAddNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Create New News", driver.FindElement(By.XPath("//body[@id='ehs-view']/div[2]/div/div/div/section[2]/div/div/h3")).Text); ;
        }

        [Given(@"I login to ehs website")]
        public void GivenILoginToEhsWebsite(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();
            driver = new FirefoxDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/sign-in");
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//div[2]/div/div/form/div/input")).SendKeys(username);
            driver.FindElement(By.XPath("//div[2]/div/div/form/div[2]/input")).SendKeys(password);
            driver.FindElement(By.XPath("//div[2]/div/div/form/center/button")).Click();
            Thread.Sleep(1000);
        }

        [Given(@"I am on manage page admin page ""(.*)""")]
        public void GivenIAmOnManagePageAdminPage(string url)
        {
            Thread.Sleep(5000);
            driver.Navigate().GoToUrl(url);
        }

        [Given(@"the Add Pages page is loaded")]
        public void GivenTheAddPagesPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Create New Page", driver.FindElement(By.XPath("//div/h3")).Text);
        }

        [Given(@"the Manage Pages page is loaded")]
        public void GivenTheManagePagesPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Pages Manage pages", driver.FindElement(By.CssSelector("h3")).Text);
        }

        [When(@"the edit page should be loaded")]
        public void WhenTheEditPageShouldBeLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Edit Page", driver.FindElement(By.XPath("//div/h3")).Text);
        }

        [When(@"I input the edit pages form")]
        public void WhenIInputTheEditPagesForm(Table table)
        {
            string title = table.Rows[0]["title"].ToString();
            string content = table.Rows[0]["content"].ToString();
            driver.FindElement(By.Id("Title")).Clear();
            driver.FindElement(By.Id("Title")).SendKeys(title);
            var tinymce_frame = driver.FindElement(By.Id("ui-tinymce-0_ifr"));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.CssSelector("body"));
            tinymce_body.Clear();
            tinymce_body.SendKeys(content);

            driver.SwitchTo().DefaultContent();
            Thread.Sleep(5000);
        }

        [When(@"I input the add page form")]
        public void WhenIInputTheAddPageForm(Table table)
        {
            string metaDescription = table.Rows[0]["metaDescription"].ToString();
            string metaKeyWords = table.Rows[0]["metaKeyWords"].ToString();
            string title = table.Rows[0]["title"].ToString();
            string url = table.Rows[0]["url"].ToString();
            string content = table.Rows[0]["content"].ToString();
            driver.FindElement(By.Id("MetaDescription")).SendKeys(metaDescription);
            driver.FindElement(By.Id("MetaKeywords")).SendKeys(metaKeyWords);
            driver.FindElement(By.Id("Title")).SendKeys(title);
            driver.FindElement(By.Id("Slug")).SendKeys(url);
            var tinymce_frame = driver.FindElement(By.Id("ui-tinymce-0_ifr"));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.CssSelector("body"));
            tinymce_body.SendKeys(content);

            driver.SwitchTo().DefaultContent();
            Thread.Sleep(5000);
        }

        [When(@"I upload the image")]
        public void WhenIUploadTheImage()
        {
            driver.FindElement(By.Id("file")).SendKeys("C:\\Users\\Voxteneo\\Downloads\\philipina.jpg");
            Thread.Sleep(5000);
        }

        [When(@"I input the add news form")]
        public void WhenIInputTheAddNewsForm(Table table)
        {
            string iframe = "ui-tinymce-0_ifr";
            string imageTitle = table.Rows[0]["imageTitle"].ToString();
            string newsTitle = table.Rows[0]["newsTitle"].ToString();
            string shortDescription = table.Rows[0]["shortDescription"].ToString();
            string newsContent = table.Rows[0]["newsContent"].ToString();
            driver.FindElement(By.XPath("//div[2]/input")).SendKeys(imageTitle);
            driver.FindElement(By.XPath("//div[3]/input")).SendKeys(newsTitle);
            driver.FindElement(By.XPath("//textarea")).SendKeys(shortDescription);
            if(newsTitle == "test latest")
            {
                iframe = "ui-tinymce-1_ifr";
            }
            var tinymce_frame = driver.FindElement(By.Id(iframe));
            driver.SwitchTo().Frame(tinymce_frame);
            var tinymce_body = driver.FindElement(By.CssSelector("body"));
            tinymce_body.SendKeys(newsContent);

            driver.SwitchTo().DefaultContent();
            Thread.Sleep(5000);
        }

        [When(@"I input the edit news form")]
        public void WhenIInputTheEditNewsForm(Table table)
        {
            string imageTitle = table.Rows[0]["imageTitle"].ToString();
            string newsTitle = table.Rows[0]["newsTitle"].ToString();
            string shortDescription = table.Rows[0]["shortDescription"].ToString();
            
            driver.FindElement(By.XPath("//div[2]/input")).SendKeys(imageTitle);
            driver.FindElement(By.XPath("//div[3]/input")).SendKeys(newsTitle);
            driver.FindElement(By.XPath("//textarea")).SendKeys(shortDescription);

            Thread.Sleep(5000);
        }

        [When(@"I click publish button")]
        public void WhenIClickPublishButton()
        {
            driver.FindElement(By.XPath("//button[2]")).Click();
            Thread.Sleep(5000);
        }

        [When(@"I click edit icon")]
        public void WhenIClickEditIcon()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//a[2]/i")).Click();
            Thread.Sleep(1000);
        }

        [Then(@"the Add News page is loaded")]
        public void ThenTheAddNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Create New News", driver.FindElement(By.XPath("//div/h3")).Text);
        }
        
        [Then(@"I should see pop-up notification ""(.*)""")]
        public void ThenIShouldSeePop_UpNotification(string msg)
        {
            Thread.Sleep(2000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//body/div/div/div/div")).Text);
            driver.Close();     
        }

        [Then(@"I should see a error message ""(.*)""")]
        public void ThenIShouldSeeAErrorMessage(string msg)
        {
            Thread.Sleep(5000);
            switch (msg)
            {
                case "page":
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div/div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div[6]/div/div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div[2]/span")).Text);
                    break;
                default:
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div[3]/div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div[3]/div/div/div/span")).Text);
                    Assert.AreEqual("This field cannot be empty", driver.FindElement(By.XPath("//div[2]/span")).Text);
                    break;
            }

        }

        [When(@"I click save to draft button")]
        public void WhenIClickSaveToDraftButton()
        {
            driver.FindElement(By.XPath("//button[@type='submit']")).Click();
        }

        [Then(@"I should see on latest news page")]
        public void ThenIShouldSeeOnLatestNewsPage()
        {
            ScenarioContext.Current.Pending();
        }

        [Given(@"I go to manage news page")]
        public void GivenIGoToManageNewsPage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/admin/news");
            Thread.Sleep(5000);
        }

        [When(@"the manage news page is loaded")]
        public void WhenTheManageNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("latest news of Educators Home Share", driver.FindElement(By.XPath("//h3/small")).Text);
        }

        [When(@"I search data ""(.*)""")]
        public void WhenISearchData(string data)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//input")).SendKeys(data);
            Thread.Sleep(5000);
        }

        [Then(@"the search by date should be works")]
        public void ThenTheSearchByDateShouldBeWorks()
        {
            Assert.AreEqual("02/08/2016", driver.FindElement(By.XPath("//div[2]/div/div/div/div[3]/div")).Text);
        }

        [Then(@"I check Add new button")]
        public void ThenICheckAddNewButton()
        {
            driver.FindElement(By.XPath("//div/div/a")).Click();
            Thread.Sleep(5000);
            Assert.AreEqual("Create New News", driver.FindElement(By.XPath("//div/h3")).Text);
            Assert.AreEqual("Upload foto", driver.FindElement(By.XPath("//label")).Text);
            Assert.AreEqual("Language", driver.FindElement(By.XPath("//div/label")).Text);
            Assert.AreEqual("Image Title", driver.FindElement(By.XPath("//div[2]/label")).Text);
            Assert.AreEqual("News Title *", driver.FindElement(By.XPath("//div[3]/label")).Text);
            Assert.AreEqual("News Outline *", driver.FindElement(By.XPath("//div[3]/div/div/label")).Text);
            Assert.AreEqual("News Content *", driver.FindElement(By.XPath("//div[3]/div[2]/div/label")).Text);
            Assert.AreEqual("Save as Draft", driver.FindElement(By.XPath("//div[3]/div/button")).Text);
            Assert.AreEqual("Publish", driver.FindElement(By.XPath("//button[2]")).Text);
        }

        [Then(@"I check search function")]
        public void ThenICheckSearchFunction()
        {
            driver.Navigate().Back();
            driver.FindElement(By.XPath("//input")).SendKeys("test");
            Thread.Sleep(5000);
            Assert.AreEqual("test news title", driver.FindElement(By.XPath("//div/div[2]/a")).Text);
            driver.FindElement(By.XPath("//input")).Clear();
            Thread.Sleep(5000);
        }

        [Then(@"I check filtering by language")]
        public void ThenICheckFilteringByLanguage()
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//select")));
            dropdown.SelectByText("French");
            Thread.Sleep(5000);
            Assert.AreEqual("French News Title", driver.FindElement(By.LinkText("French News Title")).Text);
            dropdown.SelectByText("English");
        }

        [Then(@"I check filtering by show entries ""(.*)""")]
        public void ThenICheckFilteringByShowEntries(int number)
        {
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//div[2]/form/select")));
            dropdown.SelectByText("" + number + "");
        }

        [Then(@"I check sorting the data table")]
        public void ThenICheckSortingTheDataTable()
        {
            driver.FindElement(By.XPath("//div[2]/div/div/span")).Click();
            driver.FindElement(By.XPath("//div[3]/div/div/span")).Click();
        }

        [Then(@"I check pagination")]
        public void ThenICheckPagination()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText("2")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText(">")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText(">>")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText("<")).Click();
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText("<<")).Click();
        }

        [Then(@"I check Edit News ""(.*)""")]
        public void ThenICheckEditNews(int num)
        {
            Thread.Sleep(5000);
            if(num == 1)
            {
                driver.FindElement(By.XPath("//a[2]")).Click();
                Thread.Sleep(5000);
            }
            Assert.AreEqual("Edit news", driver.FindElement(By.XPath("//div/h3")).Text);
            Assert.AreEqual("Upload foto", driver.FindElement(By.XPath("//label")).Text);
            Assert.AreEqual("Language", driver.FindElement(By.XPath("//div/label")).Text);
            Assert.AreEqual("Image Title", driver.FindElement(By.XPath("//div[2]/label")).Text);
            Assert.AreEqual("News Title *", driver.FindElement(By.XPath("//div[3]/label")).Text);
            Assert.AreEqual("News Outline *", driver.FindElement(By.XPath("//div[3]/div/div/label")).Text);
            Assert.AreEqual("News Content *", driver.FindElement(By.XPath("//div[3]/div[2]/div/label")).Text);
            Assert.AreEqual("Save as Draft", driver.FindElement(By.XPath("//div[3]/div/button")).Text);
            Assert.AreEqual("Publish", driver.FindElement(By.XPath("//button[2]")).Text);
            driver.Navigate().Back();
            Thread.Sleep(2000);
        }

        [Then(@"I check Delete News ""(.*)""")]
        public void ThenICheckDeleteNews(int num)
        {
            if(num == 1)
            {
                //driver.FindElement(By.XPath("//a[3]/i")).Click();
                IJavaScriptExecutor js = ((IJavaScriptExecutor)driver);
                var elementToClick = driver.FindElement(By.XPath("//a[3]/i"));
                js.ExecuteScript("arguments[0].click();", elementToClick);
                Thread.Sleep(2000);
                Assert.AreEqual("Delete All Translation News", driver.FindElement(By.XPath("//h5")).Text);
                Assert.AreEqual("Are you sure you want to delete news with id 9118 and all translations related?", driver.FindElement(By.XPath("//p")).Text);
                Assert.AreEqual("Cancel", driver.FindElement(By.XPath("//div[3]/button")).Text);
                Assert.AreEqual("Yes, I'm Sure", driver.FindElement(By.XPath("//button[2]")).Text);
                driver.FindElement(By.XPath("//button")).Click();
            }
            else
            {
                Thread.Sleep(2000);
                Assert.AreEqual("Delete translation", driver.FindElement(By.XPath("//h5")).Text);
                Assert.AreEqual("Are you sure delete news test latest with English translation?", driver.FindElement(By.XPath("//p")).Text);
                Assert.AreEqual("Cancel", driver.FindElement(By.XPath("//div[3]/button")).Text);
                Assert.AreEqual("Yes, I'm Sure", driver.FindElement(By.XPath("//button[2]")).Text);
                driver.FindElement(By.XPath("//button")).Click();
            }
            
        }

        [Then(@"I check view on public site")]
        public void ThenICheckViewOnPublicSite()
        {
            driver.FindElement(By.XPath("//center/a/i")).Click();
            Thread.Sleep(5000);
            driver.Navigate().Back();
        }

        [Then(@"I check see all translation")]
        public void ThenICheckSeeAllTranslation()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//div[2]/div/div[4]/a")).Click();
            Thread.Sleep(5000);
            Assert.AreEqual("Translations list", driver.FindElement(By.Id("myModalLabel")).Text);
            driver.FindElement(By.XPath("//button")).Click();
        }

        [When(@"I am on manage news admin page ""(.*)""")]
        public void WhenIAmOnManageNewsAdminPage(string url)
        {
            driver.Navigate().GoToUrl(url);
        }

        [When(@"I go to home page")]
        public void WhenIGoToHomePage()
        {
            driver.Navigate().GoToUrl("http://ehs.website-test.t1.voxteneo.com/#/");
            Thread.Sleep(5000);
        }

        [Then(@"I should see ""(.*)"" as title in latest news")]
        public void ThenIShouldSeeAsTitleInLatestNews(string title)
        {
            Assert.AreEqual(title, driver.FindElement(By.CssSelector("h6.news-title.ng-binding")).Text);
        }

        [Then(@"the Manage News page is loaded")]
        public void ThenTheManageNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("latest news of Educators Home Share", driver.FindElement(By.XPath("//h3/small")).Text);
        }

        [Then(@"I input ""(.*)"" to  search field")]
        public void ThenIInputToSearchField(string title)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//input")).SendKeys(title);
        }

        [Then(@"I should see draft status on draft news")]
        public void ThenIShouldSeeDraftStatusOnDraftNews()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Draft", driver.FindElement(By.XPath("//div[2]/div/div/div/div[3]/div")).Text);
        }

        [When(@"I click delete icon")]
        public void WhenIClickDeleteIcon()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.CssSelector("i.icon-trash")).Click();
        }

        [When(@"the delete pop-up should be appear")]
        public void WhenTheDeletePop_UpShouldBeAppear()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Delete All Translation", driver.FindElement(By.Id("exampleModalLabel")).Text);
        }

        [When(@"I click yes button")]
        public void WhenIClickYesButton()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//button[2]")).Click();
        }

        [When(@"I create news")]
        public void WhenICreateNews(Table table)
        {
            GivenIAmOnManageNewsAdminPage("http://ehs.website-test.t1.voxteneo.com/#/admin/news/create");
            GivenTheAddNewsPageIsLoaded();
            WhenIUploadTheImage();
            WhenIInputTheAddNewsForm(table);
            WhenIClickPublishButton();

        }

        [When(@"the Manage Pages page is loaded")]
        public void WhenTheManagePagesPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Pages Manage pages", driver.FindElement(By.CssSelector("h3")).Text);
        }

        [Then(@"I should see pagination")]
        public void ThenIShouldSeePagination()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText(">")).Click();
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText("<")).Click();
        }

        [Then(@"I should able to sort the list")]
        public void ThenIShouldAbleToSortTheList()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div/div[2]/div/div")).Click();
            driver.FindElement(By.XPath("//div/div/div/div[3]/div/div")).Click();
            driver.FindElement(By.XPath("//div[4]/div/div/span")).Click();
            Thread.Sleep(2000);
        }

        [Then(@"I shouldn't delete the default page")]
        public void ThenIShouldnTDeleteTheDefaultPage()
        {
            Thread.Sleep(5000);
            Assert.IsFalse(driver.FindElement(By.XPath("//div[2]/div/div[6]/center/a[3]/i")).Displayed);

        }

        [Given(@"I am on manage country page ""(.*)""")]
        public void GivenIAmOnManageCountryPage(string url)
        {
            driver.Navigate().GoToUrl(url);
        }

        [When(@"the Manage Country page is loaded")]
        public void WhenTheManageCountryPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Countries Manage Countries", driver.FindElement(By.CssSelector("h3")).Text);
        }

        [Then(@"I filter by show entries")]
        public void ThenIFilterByShowEntries()
        {
            Thread.Sleep(2000);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//select")));
            dropdown.SelectByText("10");
        }

        [Then(@"I sort by country name")]
        public void ThenISortByCountryName()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//div[3]/div/div/span")).Click();
        }

        [Then(@"I should able to edit country")]
        public void ThenIShouldAbleToEditCountry()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//center/a/i")).Click();
            Thread.Sleep(5000);
            Assert.AreEqual("Edit Country Details edit details", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual("Here you can manage data associated with the Country\r\nUpload photo", driver.FindElement(By.CssSelector("div.col-md-8")).Text);
            Assert.AreEqual("Upload photo", driver.FindElement(By.XPath("//label")).Text);
            Assert.AreEqual("Country Name *", driver.FindElement(By.CssSelector("div.form-group > label")).Text);
            Assert.AreEqual("Cancel", driver.FindElement(By.LinkText("Cancel")).Text);
            Assert.AreEqual("Save Changes", driver.FindElement(By.XPath("//center/button")).Text);
        }

        [Then(@"I should see sign-in page")]
        public void ThenIShouldSeeSign_InPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Sign In", driver.FindElement(By.XPath("//center/h6")).Text);
        }

        [When(@"I click view on public icon")]
        public void WhenIClickViewOnPublicIcon()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("i.icon-eye")).Click();
        }

        [Then(@"the page should redirect to page on public")]
        public void ThenThePageShouldRedirectToPageOnPublic()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("test123", driver.FindElement(By.XPath("//h3")).Text);
            Assert.AreEqual("tes123", driver.FindElement(By.XPath("//div[2]/p")).Text);
        }

        [When(@"I click news title ""(.*)""")]
        public void WhenIClickNewsTitle(string title)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText(title)).Click();
        }

        [Then(@"the news detail content should read only")]
        public void ThenTheNewsDetailContentShouldReadOnly()
        {
            Thread.Sleep(5000);
            Assert.IsNotNull(driver.FindElement(By.Id("Title")).GetAttribute("readonly"));
            Assert.IsNotNull(driver.FindElement(By.XPath("//div[2]/input")).GetAttribute("readonly"));
            Assert.IsNotNull(driver.FindElement(By.Id("ShortDescription")).GetAttribute("readonly"));
            var tinymce_frame = driver.FindElement(By.Id("ui-tinymce-0_ifr"));
            driver.SwitchTo().Frame(tinymce_frame);
            Assert.AreEqual("false", driver.FindElement(By.Id("tinymce")).GetAttribute("contenteditable"));
            driver.SwitchTo().DefaultContent();
        }

        [Then(@"the page should redirect to edit page when edit button clicked")]
        public void ThenThePageShouldRedirectToEditPageWhenEditButtonClicked()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText("Edit")).Click();
            Thread.Sleep(5000);
            ThenICheckEditNews(0);
        }

        [Then(@"the page should show delete pop-up when delete button clicked")]
        public void ThenThePageShouldShowDeletePop_UpWhenDeleteButtonClicked()
        {
            Thread.Sleep(2000);
            driver.FindElement(By.LinkText("Delete")).Click();
            Thread.Sleep(2000);
            ThenICheckDeleteNews(0);
        }

        [Then(@"I should see delete news verification pop-up")]
        public void ThenIShouldSeeDeleteNewsVerificationPop_Up()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("Delete All Translation News", driver.FindElement(By.Id("exampleModalLabel")).Text);
        }

        [When(@"I press enter")]
        public void WhenIPressEnter()
        {
            driver.FindElement(By.XPath("//input")).SendKeys(Keys.Enter);
        }

        [Then(@"I should on manage news page")]
        public void ThenIShouldOnManageNewsPage()
        {
            Thread.Sleep(2000);
            Assert.AreEqual("NEWS latest news of Educators Home Share", driver.FindElement(By.CssSelector("h3")).Text);
        }

        [Then(@"I should see the localization is ""(.*)""")]
        public void ThenIShouldSeeTheLocalizationIs(string url)
        {
            Thread.Sleep(5000);
            Assert.AreEqual(url, driver.Url);
        }

        [When(@"I click add icon traslation")]
        public void WhenIClickAddIconTraslation()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div[2]/div/div[2]/div/a/i")).Click();
        }

        [When(@"I click ""(.*)"" link in admin page")]
        public void WhenIClickLinkInAdminPage(string link)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.LinkText(link)).Click();
        }

        [When(@"I click edit icon in manage country")]
        public void WhenIClickEditIconInManageCountry()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("i.icon-note")).Click();
            Thread.Sleep(5000);
        }

        [Then(@"the image should be uploaded")]
        public void ThenTheImageShouldBeUploaded()
        {
            Thread.Sleep(5000);
            Assert.IsNotNull(driver.FindElement(By.Id("countryImage")).GetAttribute("src"));
        }

        [Then(@"I should see view detiail page")]
        public void ThenIShouldSeeViewDetiailPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("View Page", driver.FindElement(By.CssSelector("div.admin-content > h3")).Text);
        }

        [Then(@"all field should be read-only")]
        public void ThenAllFieldShouldBeRead_Only()
        {
            Thread.Sleep(5000);
            Assert.IsNotNull(driver.FindElement(By.XPath("//div[2]/div/input[2]")).GetAttribute("disabled"));
            Assert.IsNotNull(driver.FindElement(By.Id("Title")).GetAttribute("readonly"));
            Assert.IsNotNull(driver.FindElement(By.Id("Slug")).GetAttribute("readonly"));
            var tinymce_frame = driver.FindElement(By.Id("ui-tinymce-0_ifr"));
            driver.SwitchTo().Frame(tinymce_frame);
            Assert.AreEqual("false", driver.FindElement(By.Id("tinymce")).GetAttribute("contenteditable"));
            driver.SwitchTo().DefaultContent();
        }

        [Then(@"edit and delete button should able to click")]
        public void ThenEditAndDeleteButtonShouldAbleToClick()
        {
            Thread.Sleep(2000);
            Assert.IsTrue(driver.FindElement(By.LinkText("Edit")).Enabled);
            Assert.IsTrue(driver.FindElement(By.LinkText("Delete")).Enabled);
        }

    }
}
