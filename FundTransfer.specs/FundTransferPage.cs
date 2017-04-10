using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.PageObjects;
namespace FundTransfer.specs
{
    class FundTransferPage
    {
        public FundTransferPage(IWebDriver driver)
        {
            PageFactory.InitElements(driver, this);
        }
        [FindsBy(How = How.Id, Using = "payee")]
        public IWebElement payeeNameField { get; set; }
        [FindsBy(How = How.Id, Using = "amount")]
        public IWebElement amountField { get; set; }
        [FindsBy(How = How.Id, Using = "transfer")]
        public IWebElement transferButton { get; set; }
        [FindsBy(How = How.Id, Using = "message")]
        public IWebElement messageLabel { get; set; }
    }
}