using System;
using System.Collections.Generic;
using FFImageLoading.Forms;
using FFImageLoading.Transformations;
using FFImageLoading.Work;
using Xamarin.Forms;

namespace XamarinFormsCompareApp.Views.Performance
{
    public partial class ImageWork : ContentPage
    {
        public ImageWork()
        {
            InitializeComponent();


            var watch = System.Diagnostics.Stopwatch.StartNew();
            var normalImage = new CachedImage()
            {
                Source = "https://www.w3schools.com/w3css/img_lights.jpg",
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center,
                DownsampleToViewSize = true,
                CacheDuration = TimeSpan.FromMilliseconds(0.0)
            };
            watch.Stop();
            var normalImageTimer = watch.Elapsed;

            watch = System.Diagnostics.Stopwatch.StartNew();
            var grayscaleImage = new CachedImage()
            {
                Source = "https://www.w3schools.com/w3css/img_lights.jpg",
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center,
                DownsampleToViewSize = true,
                Transformations = new System.Collections.Generic.List<ITransformation>() {
                    new GrayscaleTransformation(),
                },
                CacheDuration = TimeSpan.FromMilliseconds(0.0)
            };
            watch.Stop();
            var grasScaleTimer = watch.Elapsed;

            var flex = new FlexLayout() { Direction = FlexDirection.Column};
            flex.Children.Add(new Label()
            {
                Text = $"Time normal: {normalImageTimer}"
            });
            flex.Children.Add(normalImage);
            flex.Children.Add(new Label()
            {
                Text = $"Time grayscale: {grasScaleTimer}"
            });
            flex.Children.Add(grayscaleImage);
            Content = flex;
        }
    }
}
