using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Xamarin.Forms;
using XamarinFormsCompareApp.Classes;

namespace XamarinFormsCompareApp.Views.Performance
{
    public partial class InfiniteScrollList : ContentPage
    {
        // TODO: GGF mit DataTemplate arbeiten, sodass RecycleElement wieder funktioniert

        PerfList perf;

        public InfiniteScrollList()
        {
            InitializeComponent();
            perf = new PerfList();
            this.BindingContext = new PerfList();
            //perfList.ItemsSource = perf.ItemsList;

            //Times.Text = perf.TimerText;
            
        }

        public void Handle_ItemAppearing(object sender, Xamarin.Forms.ItemVisibilityEventArgs e)
        {
            if (e.ItemIndex == PerfList.ItemsToAdd - 2)
            {
                ((PerfList)BindingContext).generate();
                //perf.generate();
            }
        }
    }
}
