using System;
using System.Text;
using System.Threading;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium.Support.UI;

namespace PopsChord
{
    [Binding]
    public sealed class authstep
    {
        private IWebDriver driver;

        [Given(@"I open the pops chord website")]
        public void GivenIOpenThePopsChordWebsite()
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl("http://pop-dev-web.t1.voxteneo.com/Account/Login");
        }

        [Given(@"I should see ""(.*)"" as title")]
        public void GivenIShouldSeeAsTitle(string title)
        {
            Assert.AreEqual(title, driver.Title);
        }

        [Given(@"I have entered ""(.*)"" as username")]
        public void GivenIHaveEnteredAsUsername(string username)
        {
            driver.FindElement(By.Name("usernameOrEmailAddress")).Clear();
            driver.FindElement(By.Name("usernameOrEmailAddress")).SendKeys(username);
        }

        [Given(@"I have entered ""(.*)"" as password")]
        public void GivenIHaveEnteredAsPassword(string password)
        {
            driver.FindElement(By.Name("password")).Clear();
            driver.FindElement(By.Name("password")).SendKeys(password);
        }

        [When(@"I press login")]
        public void WhenIPressLogin()
        {
            driver.FindElement(By.XPath("//button[@type='submit']")).Click();
        }

        [Then(@"I should see ""(.*)"" as error message")]
        public void ThenIShouldSeeAsErrorMessage(string msg)
        {
            Thread.Sleep(3000);
            Assert.AreEqual(msg, driver.FindElement(By.CssSelector("h2")).Text);
        }

        [Then(@"I should see ""(.*)"" as password error message")]
        public void ThenIShouldSeeAsPasswordErrorMessage(string msg)
        {
            Thread.Sleep(3000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div[7]/p")).Text);
        }

        [Then(@"I should see ""(.*)"" as title")]
        public void ThenIShouldSeeAsTitle(string title)
        {
            Assert.AreEqual(title, driver.Title);
        }

        public void successlogin()
        {
            GivenIOpenThePopsChordWebsite();
            GivenIHaveEnteredAsUsername("admin");
            GivenIHaveEnteredAsPassword("Vox2017");
            WhenIPressLogin();
        }

        [Given(@"I go to score list page")]
        public void GivenIGoToScoreListPage()
        {
            successlogin();
            Thread.Sleep(3000);
            driver.Navigate().GoToUrl("http://pop-dev-web.t1.voxteneo.com/Mpa/Score");
        }

        [Given(@"I press ""(.*)"" button")]
        public void GivenIPressButton(string button)
        {
            driver.FindElement(By.Id(button)).Click();
        }

        [Given(@"I input all required fields on score")]
        public void GivenIInputAllRequiredFieldsOnScore(Table table)
        {
            Thread.Sleep(3000);
            string Title = table.Rows[0]["title"].ToString();
            string Reference = table.Rows[0]["reference"].ToString();
            string Categories = table.Rows[0]["categories"].ToString();

            driver.FindElement(By.Id("Title")).Clear();
            driver.FindElement(By.Id("Title")).SendKeys(Title);
            driver.FindElement(By.Id("Reference")).Clear();
            var a = driver.FindElement(By.Id("CategoryIds"));
            driver.FindElement(By.Id("Reference")).SendKeys(Reference);
            SelectElement select = new SelectElement(driver.FindElement(By.Id("CategoryIds")));
            select.SelectByText(Categories);
           
        }

        [Given(@"I press next button until the link tab opened")]
        public void GivenIPressNextButtonUntilTheLinkTabOpened()
        {
            driver.FindElement(By.XPath("//div[2]/button[2]")).Click();
            driver.FindElement(By.XPath("//div[2]/button[2]")).Click();
            driver.FindElement(By.XPath("//div[2]/button[2]")).Click();
        }

        [Given(@"I input link data with")]
        public void GivenIInputLinkDataWith(Table table)
        {
            Thread.Sleep(3000);
            string Title = table.Rows[0]["title"].ToString();
            string Url = table.Rows[0]["url"].ToString();
            string Order = table.Rows[0]["order"].ToString();

            driver.FindElement(By.XPath("//div[2]/form/div/div/input")).Clear();
            driver.FindElement(By.XPath("//div[2]/form/div/div/input")).SendKeys(Title);
            driver.FindElement(By.Id("Url")).Clear();
            driver.FindElement(By.Id("Url")).SendKeys(Url);
            driver.FindElement(By.Id("Order")).Clear();
            driver.FindElement(By.Id("Order")).SendKeys(Order);
        }

        [When(@"I press the link save button")]
        public void WhenIPressTheLinkSaveButton()
        {
            driver.FindElement(By.XPath("(//button[@type='button'])[31]")).Click();
        }

        [Then(@"I should see success message if ""(.*)""")]
        public void ThenIShouldSeeSuccessMessageIf(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.CssSelector("div.toast-message")).Text);
        }

    }
}
