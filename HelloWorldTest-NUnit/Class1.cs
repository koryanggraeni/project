using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace HelloWorldTest_NUnit
{
    [TestFixture]
    public class Class1
    {
        [Test]

        public void HelloWorldTest()
        {
            Assert.True(1+1==3);
        }
    }
}
