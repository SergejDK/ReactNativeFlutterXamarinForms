using System;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace XamarinFormsCompareApp.UITests
{
    public class AppInitializer
    {
        public static IApp StartApp(Platform platform)
        {
            if (platform == Platform.Android)
            {
                return ConfigureApp.Android.StartApp();
            }
            Environment.SetEnvironmentVariable("UITEST_FORCE_IOS_SIM_RESTART", "0");
            return ConfigureApp.iOS.StartApp();
        }
    }
}