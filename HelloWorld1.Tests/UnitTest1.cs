using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Mvc;
using HelloWorld1;
using HelloWorld1.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace HelloWorld1.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void HomeIndexText()
        {
            //Arrange
            HelloWorldController controller = new HelloWorldController();

            //Act 
            ViewResult result = controller.Index() as ViewResult;

            //Assert
            Assert.AreEqual("Hello World!", );
        }
    }
}
