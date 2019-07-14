using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Xamarin.Forms;

namespace XFCompare.Views.Performance
{
    public partial class InfiniteList : ContentPage
    {
        int maxItems = 20;
        ObservableCollection<int> ll = new ObservableCollection<int>();

        public InfiniteList()
        {
            InitializeComponent();
            perfList.ItemsSource = ll;
            generate();

        }

        void generate()
        {
            for (int i = 0; i <= maxItems; i++)
            {
                ll.Add(i);
            }
        }

        void Handle_ItemAppearing(object sender, Xamarin.Forms.ItemVisibilityEventArgs e)
        {
            if (e.ItemIndex == maxItems - 2)
            {
                generate();
            }
        }
    }
}
