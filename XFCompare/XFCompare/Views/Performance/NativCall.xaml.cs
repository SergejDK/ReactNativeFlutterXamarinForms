using System;
using System.Collections.Generic;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace XFCompare.Views.Performance
{
    public partial class NativCall : ContentPage
    {
        public NativCall()
        {
            InitializeComponent();
        }

        async void Handle_Clicked(object sender, System.EventArgs e)
        {
            try
            {
                var loc = await Geolocation.GetLastKnownLocationAsync();

                if (loc != null)
                {
                    location.Text = $"Latitude: {loc.Latitude}, Longitude: {loc.Longitude}, Altitude: {loc.Altitude}";
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
