using System;
using System.Collections.Generic;
using Plugin.Media;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XamarinFormsCompare.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class NativeView : ContentPage
    {
        public NativeView()
        {
            InitializeComponent();
        }

        async void takePic(object sender, System.EventArgs e)
        {
            if(CrossMedia.Current.IsCameraAvailable && CrossMedia.Current.IsTakePhotoSupported)
            {
                var file = await CrossMedia.Current.TakePhotoAsync(new Plugin.Media.Abstractions.StoreCameraMediaOptions
                {
                    CompressionQuality = 100,
                    SaveToAlbum = true
                });
                takenPic.Source = ImageSource.FromStream(() =>
                {
                    var stream = file.GetStream();
                    return stream;
                });
            }
        }
    }
}
