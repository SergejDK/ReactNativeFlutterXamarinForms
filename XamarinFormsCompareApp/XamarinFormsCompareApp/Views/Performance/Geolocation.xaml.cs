using System;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace XamarinFormsCompareApp.Views.Performance
{
    public partial class Geolocation : ContentPage
    {
        public Geolocation()
        {
            InitializeComponent();
        }
        // Stopwatch nicht ganz akkurt, ejdoch gibt es enen guten überblick

        async void getLocation(object sender, System.EventArgs e)
        {
            try
            {
                var loc = await Xamarin.Essentials.Geolocation.GetLocationAsync();
                if (loc != null)
                {
                    Lat.Text = $"Latitude: {loc.Latitude}";
                    Long.Text = $"Longitude: {loc.Longitude}";
                }
            }
            catch (FeatureNotSupportedException fnsEx)
            {
                // Handle not supported on device exception
            }
            catch (FeatureNotEnabledException fneEx)
            {
                // Handle not enabled on device exception
            }
            catch (PermissionException pEx)
            {
                // Handle permission exception
            }
            catch (Exception ex)
            {
                // Unable to get location
            }
        }
    }
}
