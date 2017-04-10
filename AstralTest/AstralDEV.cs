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

namespace AstralTest
{
    [Binding]
    public sealed class AstralDEV
    {
        IWebDriver driver;

        [Given(@"I loggin to the website as admin \(dev\)")]
        public void GivenILogginToTheWebsiteAsAdminDev(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            driver = new FirefoxDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl("http://astral-dev.t1.voxteneo.com/en/Account/Login");

            driver.FindElement(By.Id("Email")).SendKeys(username);
            driver.FindElement(By.Id("Password")).SendKeys(password);
            driver.FindElement(By.CssSelector("input.button.blue")).Click();
        }

        [Given(@"I go to Vehicle Edit page \(dev\)")]
        public void GivenIGoToVehicleEditPageDev()
        {
            driver.Navigate().GoToUrl("http://astral-dev.t1.voxteneo.com/en/Vehicle/Edit/20");
        }

        [Given(@"I click ""(.*)"" tab \(dev\)")]
        public void GivenIClickTabDev(string tab)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.LinkText(tab)).Click();
        }

        [Given(@"I click create new button on plate tab \(dev\)")]
        public void GivenIClickCreateNewButtonOnPlateTabDev()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div/div/a/i")).Click();
        }

        [When(@"I input plate data \(dev\)")]
        public void WhenIInputPlateDataDev(Table table)
        {
            Thread.Sleep(3000);
            string plateNumber = table.Rows[0]["plateNumber"].ToString();
            string startDate = table.Rows[0]["startDate"].ToString();
            string endDate = table.Rows[0]["endDate"].ToString();


            driver.FindElement(By.Id("modal_PlateNo")).SendKeys(plateNumber);
            driver.FindElement(By.Id("modal_StartDate")).SendKeys(startDate);
            driver.FindElement(By.Id("modal_EndDate")).SendKeys(endDate);
        }

        [When(@"I click save button ""(.*)"" \(dev\)")]
        public void WhenIClickSaveButtonDev(string buttonId)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id(buttonId)).Click();
        }

        [Then(@"I should able to see message ""(.*)"" \(dev\)")]
        public void ThenIShouldAbleToSeeMessageDev(string msg)
        {
            Thread.Sleep(3000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div/div")).Text);
        }

        [Given(@"I go to document/email template page \(dev\)")]
        public void GivenIGoToDocumentEmailTemplatePageDev()
        {
            driver.Navigate().GoToUrl("http://astral-dev.t1.voxteneo.com/en/DocumentEmailTemplate/Index");
        }

        [When(@"I go to page ""(.*)"" \(dev\)")]
        public void WhenIGoToPageDev(string page)
        {
            Thread.Sleep(3000);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//span[3]/select")));
            dropdown.SelectByText("10");
            Thread.Sleep(3000);
            SelectElement dropdownpage = new SelectElement(driver.FindElement(By.XPath("//select")));
            dropdownpage.SelectByText(page);
            Thread.Sleep(2000);
        }

        [Then(@"I should see ""(.*)"" data \(dev\)")]
        public void ThenIShouldSeeDataDev(int data)
        {
            Thread.Sleep(3000);
            Assert.IsNotNull(driver.FindElement(By.XPath("//td")).Text);
            Assert.IsNotNull(driver.FindElement(By.XPath("//tr[2]/td")).Text);
        }

    }
}
