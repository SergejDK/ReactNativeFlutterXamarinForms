using System;
using System.Collections.Generic;

using Xamarin.Forms;

namespace XamarinFormsCompareApp.Views
{
    public partial class Barrierefreiheit : ContentPage
    {
        public Barrierefreiheit()
        {
            InitializeComponent();
            
        }

        void scaleLabel(object sender, System.EventArgs e)
        {
            var btnText = ((Button)sender).Text;
            if(btnText == "Größer")
            {
                ZielLabel.FontSize = ZielLabel.FontSize + 1.0;
            }
            else
            {
                ZielLabel.FontSize = ZielLabel.FontSize - 1.0;
            }
        }
    }
}
