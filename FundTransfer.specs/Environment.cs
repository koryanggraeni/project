using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using TechTalk.SpecFlow;
namespace FundTransfer.specs
{
    [Binding]
    public class Environment
    {
        private static ChromeDriver driver;
        public static IWebDriver Driver
        {
            get
            {
                return driver ?? (driver = new
          ChromeDriver(@"C:\ChromeDriver"));
            }
        }
        [AfterTestRun]
        public static void AfterTestRun()
        {
            Driver.Close();
            Driver.Quit();
            driver = null;
        }
    }
}