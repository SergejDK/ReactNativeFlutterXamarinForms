using System;
using System.Collections.Generic;
using Plugin.Media;
using Xamarin.Forms;

namespace XamarinFormsCompareApp.Views
{
    public partial class Native : ContentPage
    {
        public Native()
        {
            InitializeComponent();
        }

        async void takePic(object sender, System.EventArgs e)
        {
            if (CrossMedia.Current.IsCameraAvailable && CrossMedia.Current.IsTakePhotoSupported)
            {
                var file = await CrossMedia.Current.TakePhotoAsync(new Plugin.Media.Abstractions.StoreCameraMediaOptions
                {
                    CompressionQuality = 100,
                    SaveToAlbum = true,
                    Directory = "XamarinForms-Picture"
                });
                takenpic.Source = ImageSource.FromStream(() =>
                {
                    var stream = file.GetStream();
                    return stream;
                });
            }
        }
    }
}
