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

namespace MyProject.Specs
{
    [Binding]
    public class OrderingAnswersSteps
    {
        IWebDriver driver;
        [Given(@"there is a question ""(.*)"" with the answers")]
        public void GivenThereIsAQuestionWithTheAnswers(string p0, Table table)
        {
            driver = new FirefoxDriver();
            driver.Navigate().GoToUrl("https://www.google.co.id");
        }
        
        [When(@"you upvote answer ""(.*)""")]
        public void WhenYouUpvoteAnswer(string p0)
        {
            
        }
        
        [Then(@"the answer ""(.*)"" should be on top")]
        public void ThenTheAnswerShouldBeOnTop(string p0)
        {
            
        }
    }
}
