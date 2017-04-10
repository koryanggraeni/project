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
    public sealed class testEHSwelcomet1Steps
    {
        IWebDriver driver;

        [Given(@"I am on landing page ""(.*)""")]
        public void GivenIAmOnLandingPage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
        }

        [When(@"the page is loaded")]
        public void WhenThePageIsLoaded()
        {
            Assert.AreEqual("Educators Home Share", driver.FindElement(By.XPath("//h3")).Text);
        }

        [Then(@"scroll should not appear")]
        public void ThenScrollShouldNotAppear()
        {
            IJavaScriptExecutor js = driver as IJavaScriptExecutor;
            js.ExecuteScript("window.scrollBy(0,0)", "");
            Thread.Sleep(500);
            driver.Close();
        }
    }
}
