using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using NUnit.Framework;
using OpenQA.Selenium;
namespace FundTransfer.specs
{
    [Binding]
    public class FundTransferStepDefs
    {
        FundTransferPage _ftPage = new
        FundTransferPage(Environment.Driver);
        [Given(@"the user is on Fund Transfer Page")]
        public void GivenUserIsOnFundTransferPage()
        {
            Environment.Driver.Navigate().GoToUrl("http://localhost: 64895 / Default.aspx");
        }
        [When(@"he enters ""(.*)"" as payee name")]
        public void WhenUserEneteredIntoThePayeeNameField(string payeeName)
        {
            _ftPage.payeeNameField.SendKeys(payeeName);
        }
        [When(@"he enters ""(.*)"" as amount")]
        public void WhenUserEneteredIntoTheAmountField(string amount)
        {
            _ftPage.amountField.SendKeys(amount);
        }
        [When(@"he enters ""(.*)"" as amount above his limit")]
        public void WhenUserEneteredIntoTheAmountFieldAboveLimit(string amount)
        {
            _ftPage.amountField.SendKeys(amount);
        }
        [When(@"he Submits request for Fund Transfer")]
        public void WhenUserPressTransferButton()
        {
            _ftPage.transferButton.Click();
        }
        [Then(@"ensure the fund transfer is complete with ""(.*)""message")]
        public void ThenFundTransferIsComplete(string message)
        {
            Assert.AreEqual(message, _ftPage.messageLabel.Text);
        }
        [Then(@"ensure a transaction failure message ""(.*)"" is displayed")]
        public void ThenFundTransferIsFailed(string message)
        {
            Assert.AreEqual(message, _ftPage.messageLabel.Text);
        }
    }
}