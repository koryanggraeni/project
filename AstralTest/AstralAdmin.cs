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
    public sealed class AstralAdmin
    {
        IWebDriver driver;

        [Given(@"I loggin to the website as admin")]
        public void GivenILogginToTheWebsiteAsAdmin(Table table)
        {
            string username = table.Rows[0]["username"].ToString();
            string password = table.Rows[0]["password"].ToString();

            driver = new FirefoxDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/Account/Login");

            driver.FindElement(By.Id("Email")).SendKeys(username);
            driver.FindElement(By.Id("Password")).SendKeys(password);
            driver.FindElement(By.CssSelector("input.button.blue")).Click();
        }

        [When(@"I input the Vehicle type name ""(.*)""")]
        public void WhenIInputTheVehicleTypeName(string name)
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/VehicleType/create");
            driver.FindElement(By.Id("Name")).SendKeys(name);
        }

        [When(@"I press ""(.*)"" button")]
        public void WhenIPressButton(string button)
        {
            driver.FindElement(By.XPath("//form/button")).Click();
        }

        [Then(@"I should see the alert success message ""(.*)""")]
        public void ThenIShouldSeeTheAlertSuccessMessage(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.CssSelector("div.alert.alert-success")).Text);
        }

        [Then(@"I should see the alert error message ""(.*)""")]
        public void ThenIShouldSeeTheAlertErrorMessage(string msg)
        {
            Assert.AreEqual(msg, driver.FindElement(By.CssSelector("div.alert.alert-danger")).Text);
        }

        [Then(@"I should see the error message ""(.*)""")]
        public void ThenIShouldSeeTheErrorMessage(string field)
        {
            Assert.AreEqual("The "+ field +" field is required.", driver.FindElement(By.CssSelector("span.field-validation-error.text-danger")).Text);
        }

        [Given(@"I go to Costumer Edit page")]
        public void GivenIGoToCostumerEditPage()
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/Customer/Edit/7#");
        }

        [Given(@"I click ""(.*)"" tab")]
        public void GivenIClickTab(string tab)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.LinkText(tab)).Click();
        }

        [When(@"I click ""(.*)"" tab")]
        public void WhenIClickTab(string tab)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.LinkText(tab)).Click();
        }

        [Given(@"I click edit icon on driver tab")]
        public void GivenIClickEditIconOnDriverTab()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.XPath("//td[3]/button")).Click();
        }

        [When(@"I input driver name")]
        public void WhenIInputDriverName()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//form/div/div[2]/div/input")).Clear();
            driver.FindElement(By.XPath("//form/div/div[2]/div/input")).SendKeys("Kim");
            driver.FindElement(By.XPath("//form/div/div[3]/div/input")).Clear();
            driver.FindElement(By.XPath("//form/div/div[3]/div/input")).SendKeys("Kim Woo Bin");
        }

        [Given(@"I delete all data")]
        public void GivenIDeleteAllData()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//form/div/div[2]/div/input")).Clear();
            driver.FindElement(By.XPath("//form/div/div[3]/div/input")).Clear();
            driver.FindElement(By.Id("BirthDate")).Clear();
            driver.FindElement(By.Id("LicenseNumber")).Clear();
            driver.FindElement(By.Id("LicenseTypeExpiryDate")).Clear();
            driver.FindElement(By.Id("LicenseTypeDateOfIssue")).Clear();
            driver.FindElement(By.Id("LicenseTypePlaceOfIssue")).Clear();
        }

        [Given(@"I input the birth date")]
        public void GivenIInputTheBirthDate()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id("BirthDate")).Clear();
            Thread.Sleep(3000);
            driver.FindElement(By.Id("BirthDate")).SendKeys("16/07/2000");
        }

        [When(@"I click save button ""(.*)""")]
        public void WhenIClickSaveButton(string buttonId)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id(buttonId)).Click();
        }

        [Then(@"I should able to see message ""(.*)""")]
        public void ThenIShouldAbleToSeeMessage(string msg)
        {
            Thread.Sleep(3000);
            Assert.AreEqual(msg, driver.FindElement(By.XPath("//div/div")).Text);
        }

        [Then(@"I should able to see the error message")]
        public void ThenIShouldAbleToSeeTheErrorMessage()
        {
            Thread.Sleep(3000);
            Assert.AreEqual("Name cannot be blank.", driver.FindElement(By.XPath("//div[2]/div/span/span")).Text);
            Assert.AreEqual("Surname cannot be blank.", driver.FindElement(By.XPath("//form/div/div[3]/div/span/span")).Text);
            Assert.AreEqual("Birth Date cannot be blank.", driver.FindElement(By.XPath("//div[4]/div/span/span")).Text);
            Assert.AreEqual("License Number cannot be blank.", driver.FindElement(By.XPath("//div[5]/div/span/span")).Text);
            Assert.AreEqual("Expiry Date cannot be blank.", driver.FindElement(By.XPath("//div[6]/div/span/span")).Text);
            Assert.AreEqual("Date of Issue cannot be blank.", driver.FindElement(By.XPath("//div[7]/div/span/span")).Text);
            Assert.AreEqual("Place of Issue cannot be blank.", driver.FindElement(By.XPath("//div[8]/div/span/span")).Text);
        }

        [Then(@"I should able to see the error message on brithdate")]
        public void ThenIShouldAbleToSeeTheErrorMessageOnBrithdate()
        {
            Thread.Sleep(3000);
            Assert.AreEqual("Driver under 18 years is forbidden.", driver.FindElement(By.XPath("//div[4]/div/span/span")).Text);
        }

        [When(@"I click close button on edit driver pop-up")]
        public void WhenIClickCloseButtonOnEditDriverPop_Up()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id("modalDriverCancel")).Click();
        }

        [Given(@"I go to Customer list page")]
        public void GivenIGoToCustomerListPage()
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/Customer/Index");
        }

        [Given(@"I open filter form")]
        public void GivenIOpenFilterForm()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.CssSelector("i.icon.ion-ios-settings")).Click();
        }

        [When(@"I input name with ""(.*)""")]
        public void WhenIInputNameWith(string name)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id("Name")).SendKeys(name);
        }

        [When(@"I press search button")]
        public void WhenIPressSearchButton()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.Id("filterSuppliers")).Click();
        }

        [Then(@"I should see the customer with surename ""(.*)""")]
        public void ThenIShouldSeeTheCustomerWithSurename(string surename)
        {
            Thread.Sleep(3000);
            string name = driver.FindElement(By.XPath("//td")).Text;
            var parserMyUrl = ParseQueryString(name);
            string nameresult = (name.Split(',').Last()).Split(' ').Last();
            Assert.AreEqual(surename, nameresult);
        }

        [Given(@"I go to Vehicle Edit page")]
        public void GivenIGoToVehicleEditPage()
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/Vehicle/Edit/16");
        }

        [Given(@"I click create new button on plate tab")]
        public void GivenIClickCreateNewButtonOnPlateTab()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.XPath("//div/div/a/i")).Click();
        }

        [When(@"I input plate data")]
        public void WhenIInputPlateData(Table table)
        {
            Thread.Sleep(3000);
            string plateNumber = table.Rows[0]["plateNumber"].ToString();
            string startDate = table.Rows[0]["startDate"].ToString();
            string endDate = table.Rows[0]["endDate"].ToString();


            driver.FindElement(By.Id("modal_PlateNo")).SendKeys(plateNumber);
            driver.FindElement(By.Id("modal_StartDate")).SendKeys(startDate);
            driver.FindElement(By.Id("modal_EndDate")).SendKeys(endDate);
        }

        [Given(@"I go to document/email template page")]
        public void GivenIGoToDocumentEmailTemplatePage()
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/DocumentEmailTemplate/Index");
        }

        [When(@"I go to page ""(.*)""")]
        public void WhenIGoToPage(string page)
        {
            Thread.Sleep(3000);
            SelectElement dropdown = new SelectElement(driver.FindElement(By.XPath("//span[3]/select")));
            dropdown.SelectByText("10");
            Thread.Sleep(3000);
            SelectElement dropdownpage = new SelectElement(driver.FindElement(By.XPath("//select")));
            dropdownpage.SelectByText(page);
            Thread.Sleep(2000);
        }

        [Then(@"I should see ""(.*)"" data")]
        public void ThenIShouldSeeData(int data)
        {
            Thread.Sleep(3000);
            Assert.IsNotNull(driver.FindElement(By.XPath("//td")).Text);
            Assert.IsNotNull(driver.FindElement(By.XPath("//tr[2]/td")).Text);
        }

        [Given(@"I go to document/email template edit page")]
        public void GivenIGoToDocumentEmailTemplateEditPage()
        {
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/en/DocumentEmailTemplate/Edit/15");
        }

        [When(@"I click delete icon")]
        public void WhenIClickDeleteIcon()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.CssSelector("i.icon.ion-ios-trash-outline")).Click();
        }

        [When(@"I click save button on document/email template page")]
        public void WhenIClickSaveButtonOnDocumentEmailTemplatePage()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.CssSelector("input.button.blue")).Click();
        }

        [When(@"I press ""(.*)"" menu on side bar menu")]
        public void WhenIPressMenuOnSideBarMenu(string menu)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.LinkText(menu)).Click();
        }

        [When(@"I change language to ""(.*)""")]
        public void WhenIChangeLanguageTo(string lang)
        {
            Thread.Sleep(3000);
            driver.FindElement(By.CssSelector("button.select.dropdown-toggle")).Click();
            Thread.Sleep(3000);
            driver.FindElement(By.LinkText(lang)).Click();
        }

        [Then(@"I should see correct translation")]
        public void ThenIShouldSeeCorrectTranslation(Table table)
        {
            Thread.Sleep(3000);
            foreach (var row in table.Rows)
            {
                string xpath = row["xpath"].ToString();
                string translation = row["translation"].ToString();
                Assert.AreEqual(translation, driver.FindElement(By.XPath(xpath)).Text);
            }
        }

        [When(@"I go to customer page")]
        public void WhenIGoToCustomerPage()
        {
            Thread.Sleep(3000);
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/fr/Customer/Index");
        }

        [When(@"I press filter icon")]
        public void WhenIPressFilterIcon()
        {
            Thread.Sleep(3000);
            driver.FindElement(By.CssSelector("i.icon.ion-ios-settings")).Click();
        }

        [When(@"I go to vehicle page")]
        public void WhenIGoToVehiclePage()
        {
            Thread.Sleep(3000);
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/fr/Vehicle/Index");
        }

        [When(@"I go to customer group page")]
        public void WhenIGoToCustomerGroupPage()
        {
            Thread.Sleep(3000);
            driver.Navigate().GoToUrl("http://astral-test.t1.voxteneo.com/fr/CustomerGroup/Index");
        }

        public NameValueCollection ParseQueryString(string s)
        {
            NameValueCollection nvc = new NameValueCollection();
            // remove anything other than query string from url
            if (s.Contains("?"))
            {
                s = s.Substring(s.IndexOf('?') + 1);
            }
            foreach (string vp in Regex.Split(s, "&"))
            {
                string[] singlePair = Regex.Split(vp, "=");
                if (singlePair.Length == 2)
                {
                    nvc.Add(singlePair[0], singlePair[1]);
                }
                else
                {
                    // only one key with no value specified in query string
                    nvc.Add(singlePair[0], string.Empty);
                }
            }
            return nvc;
        }
    }
}
