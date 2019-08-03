using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace XamarinFormsCompareApp.UITests
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
        public void LookFeelScreen()
        {
            const string testString = "UI Test works!";
            app.SwipeLeftToRight(0.99, 1000);
            app.Screenshot("Drawer open");
            app.Tap(x => x.Text("Look and Feel"));
            app.Screenshot("Look and Feel");
            app.WaitForElement(x => x.Marked("standardEntry"));
            app.EnterText(c => c.Marked("standardEntry"), testString);
            var text = app.Flash(x => x.Marked("standardEntry")).First().Text;
            Assert.AreEqual(text, testString);
        }
    }
}
