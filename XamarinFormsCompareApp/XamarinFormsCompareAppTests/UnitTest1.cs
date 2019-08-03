using System;
using XamarinFormsCompareApp.Classes;
using XamarinFormsCompareApp.Views.Performance;
using Xunit;

namespace XamarinFormsCompareAppTests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            // Conrtustorcall will create the amount int the ItemsToAdd variable
            PerfList perfList = new PerfList();
            Assert.True(perfList.ItemsList.Count == PerfList.ItemsToAdd);
        }
    }
}
