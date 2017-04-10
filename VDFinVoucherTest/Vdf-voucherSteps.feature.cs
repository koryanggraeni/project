using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using NUnit.Framework;
using System.Threading;

namespace VDFinVoucherTest
{
    [Binding]
    public sealed class DownloadPDFSteps
    {
        IWebDriver driver;

        [Given(@"I navigate to the page ""(.*)""")]
        public void GivenINavigateToThePage(string url)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl(url);
        }

        [Given(@"I input contract number field with ""(.*)""")]
        public void GivenIInputContractNumberFieldWith(string contractNumber)
        {
            driver.FindElement(By.Name("ContractNumber")).SendKeys(contractNumber);
        }

        [Given(@"I press submit button")]
        public void GivenIPressSubmitButton()
        {
            driver.FindElement(By.CssSelector("input.submit-button")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));
        }

        [When(@"I press print button")]
        public void WhenIPressPrintButton()
        {
            driver.FindElement(By.Id("btn-print")).Click();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(5));
        }

        [Then(@"PDF should be downloaded")]
        public void ThenPDFShouldBeDownloaded()
        {
            Thread.Sleep(5000);
            driver.Close();
        }

        [When(@"The home page is loaded")]
        public void WhenTheHomePageIsLoaded()
        {
            Thread.Sleep(1000);
            Assert.AreEqual("Bienvenue", driver.FindElement(By.CssSelector("li")).Text);
        }

        [Then(@"I should see the text in homepage")]
        public void ThenIShouldSeeTheTextInHomepage(Table table)
        {
            foreach (var row in table.Rows)
            {
                string line = row["line"].ToString();
                string text = row["text"].ToString();

                switch (line)
                {
                    case "//li[2]":
                        Assert.AreEqual(text, driver.FindElement(By.XPath(line)).Text);
                        break;
                    case "//span[2]":
                        Assert.AreEqual(text, driver.FindElement(By.XPath(line)).Text);
                        break;
                    default:
                        Assert.AreEqual(text, driver.FindElement(By.CssSelector(line)).Text);
                        break;
                }
            }
        }

        [When(@"The landing page is loaded")]
        public void WhenTheLandingPageIsLoaded()
        {
            Assert.AreEqual("Le moment est venu d’envisager quelque chose de nouveau", driver.FindElement(By.CssSelector("h1")).Text);
        }

        [Then(@"I should see the text in landing page")]
        public void ThenIShouldSeeTheTextInLandingPage(Table table)
        {
            foreach (var row in table.Rows)
            {
                string line = row["line"].ToString();
                string text = row["text"].ToString();
                switch (line)
                {
                    case "//p[2]":
                        Assert.AreEqual(text, driver.FindElement(By.XPath(line)).Text);
                        break;
                    case "//p[3]":
                        Assert.AreEqual(text, driver.FindElement(By.XPath(line)).Text);
                        break;
                    default:
                        Assert.AreEqual(text, driver.FindElement(By.CssSelector(line)).Text);
                        break;
                }
            }
        }

        [Then(@"I click help button")]
        public void ThenIClickHelpButton()
        {
            driver.FindElement(By.Id("chassis-help")).Click();
        }

        [Then(@"I should see the text in help pop-up")]
        public void ThenIShouldSeeTheTextInHelpPop_Up(Table table)
        {
            foreach (var row in table.Rows)
            {
                string line = row["line"].ToString();
                string text = row["text"].ToString();
           
                Assert.AreEqual(text, driver.FindElement(By.CssSelector(line)).Text);
            }
        }

        [Then(@"I shouldn't see the blue box ""(.*)""")]
        public void ThenIShouldnTSeeTheBlueBox(string lang)
        {
            if(lang == "FR")
            {
                Assert.AreNotEqual("Attention : Cette offre est réservée aux clients propriétaires du véhicule concerné et :\n - qui n’exercent aucune activité dans le domaine du leasing automobile ou de la location automobile, ou\n - qui n’ont pas conclu une convention Fleet à partir du type D avec la SA D’Ieteren\n (http://www.fleetbydieteren.be/politique_fleet). Cette action est uniquement valable une fois la mise à jour réalisée. Les clients qui ne souhaitent pas répondre à l’invitation de mettre leur véhicule en conformité ne peuvent pas bénéficier des avantages proposés sur trustgift.be", driver.FindElement(By.CssSelector("div.attention")).Text);
            }
            else
            {
                Assert.AreNotEqual("Opmerking: Dit aanbod is enkel geldig voor klanten die eigenaar zijn van het voertuig en:\n - die niet actief zijn in de leasing of verhuur van voertuigen, en \n - die geen fleetovereenkomst van type D hebben afgesloten met s.a. D'Ieteren n.v.\n (http://www.fleetbydieteren.be/politique_fleet). \n Dit aanbod is pas geldig nadat de update is uitgevoerd. Klanten die niet wensen in te gaan op de uitnodiging om de technische maatregelen voor hun voertuig te laten uitvoeren, kunnen helaas niet genieten van de voordelen op trustgift.be", driver.FindElement(By.CssSelector("div.attention")).Text);
            }
        }

        [Then(@"I shouldn't see the bullet ""(.*)""")]
        public void ThenIShouldnTSeeTheBullet(string lang)
        {
            if(lang == "FR")
            {
                Assert.AreNotEqual("Prénom", driver.FindElement(By.XPath("//form/div/div/div/div[2]/div[2]")).Text);
                Assert.AreNotEqual("Nom", driver.FindElement(By.XPath("//form/div/div/div/div[3]/div[2]")).Text);
                Assert.AreNotEqual("Adresse Postale", driver.FindElement(By.XPath("//form/div/div/div/div[4]/div[2]")).Text);
                Assert.AreNotEqual("Rue et Numéro", driver.FindElement(By.XPath("//form/div/div/div/div[5]/div[2]")).Text);
                Assert.AreNotEqual("Boîte", driver.FindElement(By.XPath("//form/div/div/div/div[6]/div[2]")).Text);
                Assert.AreNotEqual("Code Postal", driver.FindElement(By.XPath("//form/div/div/div[2]/div/div[2]")).Text);
                Assert.AreNotEqual("Ville", driver.FindElement(By.XPath("//form/div/div/div[2]/div[2]/div[2]")).Text);
                Assert.AreNotEqual("Téléphone", driver.FindElement(By.XPath("//form/div/div/div[2]/div[3]/div[2]")).Text);
                Assert.AreNotEqual("GSM", driver.FindElement(By.XPath("//form/div/div/div[2]/div[4]/div[2]")).Text);
                Assert.AreNotEqual("Date de Naissance", driver.FindElement(By.XPath("//form/div/div/div[2]/div[5]/div[2]")).Text);
                Assert.AreNotEqual("Adresse e-mail", driver.FindElement(By.XPath("//form/div/div/div[2]/div[6]/div[2]")).Text);
            }
            else
            {
                Assert.AreNotEqual("Voornaam", driver.FindElement(By.XPath("//form/div/div/div/div[2]/div[2]")).Text);
                Assert.AreNotEqual("Naam", driver.FindElement(By.XPath("//form/div/div/div/div[3]/div[2]")).Text);
                Assert.AreNotEqual("Adres", driver.FindElement(By.XPath("//form/div/div/div/div[4]/div[2]")).Text);
                Assert.AreNotEqual("Straat + nummer", driver.FindElement(By.XPath("//form/div/div/div/div[5]/div[2]")).Text);
                Assert.AreNotEqual("Bus", driver.FindElement(By.XPath("//form/div/div/div/div[6]/div[2]")).Text);
                Assert.AreNotEqual("Postcode", driver.FindElement(By.XPath("//form/div/div/div[2]/div/div[2]")).Text);
                Assert.AreNotEqual("Gemeente", driver.FindElement(By.XPath("//form/div/div/div[2]/div[2]/div[2]")).Text);
                Assert.AreNotEqual("Telefoonnummer", driver.FindElement(By.XPath("//form/div/div/div[2]/div[3]/div[2]")).Text);
                Assert.AreNotEqual("Gsm", driver.FindElement(By.XPath("//form/div/div/div[2]/div[4]/div[2]")).Text);
                Assert.AreNotEqual("Geboortedatum", driver.FindElement(By.XPath("//form/div/div/div[2]/div[5]/div[2]")).Text);
                Assert.AreNotEqual("E-mail", driver.FindElement(By.XPath("//form/div/div/div[2]/div[6]/div[2]")).Text);
            }
        }

        [When(@"I press email button")]
        public void WhenIPressEmailButton()
        {
            driver.FindElement(By.Id("txtNextEmail")).Click();
        }

        [Then(@"I should see the email field is filled")]
        public void ThenIShouldSeeTheEmailFieldIsFilled()
        {
            Assert.AreEqual("Email@Address.com2", driver.FindElement(By.Id("txtNextEmail")).Text);
        }

        [Then(@"I should see ""(.*)"" in next button")]
        public void ThenIShouldSeeInNextButton(string translation)
        {
            Assert.AreEqual(translation, driver.FindElement(By.XPath("//div[3]/div/button")).Text);
        }

        [Then(@"I shouldn't see email text twice")]
        public void ThenIShouldnTSeeEmailTextTwice()
        {
            Assert.AreNotEqual("Email", driver.FindElement(By.XPath("//div[5]/div[2]/div/label")).Text);
        }

        [Then(@"I the text in box should has been changed")]
        public void ThenITheTextInBoxShouldHasBeenChanged()
        {
            Assert.AreEqual("Vul uw persoonlijke gegevens in om van deze voordelen te genieten!\n\n1. Vul uw persoonlijke gegevens in.\n 2. Sla uw gegevens op.\n 3. Klik op ‘Afdrukken‘ om uw voordelen te visualiseren en af te drukken.\n 4. Klik op ‘E-mail’ om een Kopie van de voordelen via e-mail te versturen.", driver.FindElement(By.XPath("//section/div/div/div/div/div/div")).Text);
        }

        [Then(@"I should see address has changed ""(.*)""")]
        public void ThenIShouldSeeAddressHasChanged(string lang)
        {
            if(lang == "FR")
            {
                Assert.AreEqual("Rue", driver.FindElement(By.XPath("//div[4]/label")).Text);
            }
            else
            {
                Assert.AreEqual("Straat", driver.FindElement(By.XPath("//div[4]/label")).Text);
            }
        }

        [Then(@"I should see the label translation has been changed")]
        public void ThenIShouldSeeTheLabelTranslationHasBeenChanged()
        {
            Assert.AreEqual("Complétez vos informations personnelles pour profiter de ces avantages !\n\n1. Complétez vos informations.\n 2. Sauvegardez vos informations.\n 3. Cliquez sur ‘Imprimer’ afin de visualiser vos avantages et de les imprimer.\n 4. Cliquez sur ‘E-mail’ afin d’envoyer une copie du document via e-mail.", driver.FindElement(By.XPath("//section/div/div/div/div/div/div")).Text);
        }

    }
}
