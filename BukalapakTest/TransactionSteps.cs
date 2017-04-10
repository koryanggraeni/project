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

namespace TestSelenium
{
    [Binding]
    public class TransactionSteps
    {
        IWebDriver driver;

        [Given(@"I success do order transaction")]
        public void GivenISuccessDoOrderTransaction()
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl("www.google.co.id");
            //do successfully order
        }
        
        [When(@"I arrive to successful trasaction page")]
        public void WhenIArriveToSuccessfulTrasactionPage()
        {
            Assert.Equals("Transaction Successful!", driver.FindElement(By.Id("label")).Text);
        }
        
        [Then(@"I should see correct data for transaction")]
        public void ThenIShouldSeeCorrectDataForTransaction(Table table)
        {
            string TRX_ID = table.Rows[0]["TRX_ID"].ToString();
            string ADDRESS_SHIP = table.Rows[0]["ADDRESS_SHIP"].ToString();
            string DATE_ORDER = table.Rows[0]["DATE_ORDER"].ToString();
            string SELLER_NAME = table.Rows[0]["SELLER_NAME"].ToString();
            string DELIVERY_SERVICE = table.Rows[0]["DELIVERY_SERVICE"].ToString();

            foreach (var row in table.Rows)
            {
                Assert.AreEqual(TRX_ID, driver.FindElement(By.Id("transactionId")).Text);
                Assert.AreEqual(SELLER_NAME, driver.FindElement(By.Id("seller")).Text);
                Assert.AreEqual(DELIVERY_SERVICE, driver.FindElement(By.Id("deliveryService")).Text);
                Assert.AreEqual(DATE_ORDER, driver.FindElement(By.Id("dateOrder")).Text);
                Assert.AreEqual(ADDRESS_SHIP, driver.FindElement(By.Id("addressShipment")).Text);
            }
        }
    }
}
