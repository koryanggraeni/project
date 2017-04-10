using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using NUnit.Framework;
using System.Threading;

namespace TryTinymce
{
    [Binding]
    public sealed class tryTinymceSteps
    {
        IWebDriver driver;

        [Given(@"I am on manage news admin page ""(.*)""")]
        public void GivenIAmOnManageNewsAdminPage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
        }

        [Given(@"the Add News page is loaded")]
        public void GivenTheAddNewsPageIsLoaded()
        {
            Thread.Sleep(5000);
            Assert.AreEqual("Create New News", driver.FindElement(By.XPath("//body[@id='ehs-view']/div[2]/div/div/div/section[2]/div/div/h3")).Text); ;
        }

        [When(@"I upload the image")]
        public void WhenIUploadTheImage()
        {
            //driver.FindElement(By.XPath("//center/input")).SendKeys("C:\\Users\\Voxteneo\\Downloads\\philipina.jpg");
            //Thread.Sleep(15000);
        }

        [When(@"I input the add news form")]
        public void WhenIInputTheAddNewsForm(Table table)
        {
            string imageTitle = table.Rows[0]["imageTitle"].ToString();
            string newsTitle = table.Rows[0]["newsTitle"].ToString();
            string shortDescription = table.Rows[0]["shortDescription"].ToString();
            string newsContent = table.Rows[0]["newsContent"].ToString();
            driver.FindElement(By.XPath("//div[2]/input")).SendKeys(imageTitle);
            driver.FindElement(By.XPath("//div[3]/input")).SendKeys(newsTitle);
            driver.FindElement(By.XPath("//textarea")).SendKeys(shortDescription);
            driver.FindElement(By.ClassName("mce-content-body")).SendKeys(newsContent);
            Thread.Sleep(5000);
        }

        [When(@"I click publish button")]
        public void WhenIClickPublishButton()
        {
            ScenarioContext.Current.Pending();
        }

        [Then(@"I should see a success alert")]
        public void ThenIShouldSeeASuccessAlert()
        {
            ScenarioContext.Current.Pending();
        }

    }
}
