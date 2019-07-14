using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace XFCompare.UITests
{
    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public class Tests
    {
        IApp app;
        Platform platform;

        public Tests(Platform platform)
        {
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void HomeScreen()
        {
            AppResult[] results = app.WaitForElement(c => c.Marked("HomeLabel"));
            app.Screenshot("HomeLabel");

            Assert.IsTrue(results.Any());
        }

        [Test]
        public void LookFeelScreen()
        {
            app.SwipeLeftToRight(0.99, 1000);
            app.Screenshot("Drawer open");
            app.Tap(x => x.Id("NoResourceEntry-14"));
            app.Screenshot("Perfromance Image");
            app.WaitForElement(x => x.Marked("img"));
            var imgs = app.Flash(x => x.Marked("img"));
            Assert.AreEqual(imgs.Length, 2);
        }
    }
}
