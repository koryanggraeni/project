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
    public sealed class testProductionSteps
    {
        IWebDriver driver;

        [Given(@"I go to the landing page ""(.*)""")]
        public void GivenIGoToTheLandingPage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
        }


        [Given(@"I input the following page")]
        public void GivenIInputTheFollowingPage(Table table)
        {
            string firstName = table.Rows[0]["FirstName"].ToString();
            string lastName = table.Rows[0]["LastName"].ToString();
            string country = table.Rows[0]["CountryOfResidence"].ToString();
            string email = table.Rows[0]["Email"].ToString();

            driver.FindElement(By.Id("FirstName")).SendKeys(firstName);
            driver.FindElement(By.Id("LastName")).SendKeys(lastName);
            driver.FindElement(By.XPath("//div[3]/div/input")).Click();
            driver.FindElement(By.XPath("//div/ul/li[2]/span")).Click();
            driver.FindElement(By.Id("Email")).SendKeys(email);
            driver.FindElement(By.Id("ReEmail")).SendKeys(email);
        }

        [Given(@"I press i'm not robot")]
        public void GivenIPressIMNotRobot()
        {
            Thread.Sleep(60000);
        }

        [When(@"I press sign up button")]
        public void WhenIPressSignUpButton()
        {
            driver.FindElement(By.XPath("//div[2]/a")).Click();
        }

        [Then(@"I should on welcome page")]
        public void ThenIShouldOnWelcomePage()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Educators Home Share!", driver.FindElement(By.CssSelector("h3")).Text);
            Assert.AreEqual("WELCOME TO", driver.FindElement(By.XPath("//h5")).Text);
            driver.Close();
        }

    }
}
