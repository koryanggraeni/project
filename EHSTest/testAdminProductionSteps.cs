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
    public sealed class testAdminProductionSteps
    {
        IWebDriver driver;

        [Given(@"I am on admin page ""(.*)""")]
        public void GivenIAmOnAdminPage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
        }

        [Given(@"I input the email and password")]
        public void GivenIInputTheEmailAndPassword(Table table)
        {
            string email = table.Rows[0]["email"].ToString();
            string password = table.Rows[0]["password"].ToString();

            driver.FindElement(By.Id("Username")).SendKeys(email);
            driver.FindElement(By.Id("Password")).SendKeys(password);
        }

        [When(@"I press Sign In button in admin page")]
        public void WhenIPressSignInButtonInAdminPage()
        {
            driver.FindElement(By.XPath("//center/input")).Click();
        }

        [Then(@"I should on User List page")]
        public void ThenIShouldOnUserListPage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Users List", driver.FindElement(By.XPath("//h1")).Text);
            driver.Close();
        }
    }
}
