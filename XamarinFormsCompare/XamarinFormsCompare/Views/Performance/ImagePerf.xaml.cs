using System;
using System.Collections.Generic;
using System.Drawing;

using Xamarin.Forms;

namespace XamarinFormsCompare.Views.Performance
{
    public partial class ImagePerf : ContentPage
    {
        public ImagePerf()
        {
            InitializeComponent();

            //Standard call to get Image from url
            //urlImage.Source = new UriImageSource    { Uri = new Uri(@"https://www.w3schools.com/w3css/img_lights.jpg") };

            // FFImageLoading used

            //urlImageGrayscale.Source = new UriImageSource { Uri = new Uri(@"https://www.w3schools.com/w3css/img_lights.jpg") };

        }
    }
}
