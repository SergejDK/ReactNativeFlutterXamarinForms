using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XFCompare.Views.LookFeel
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LFStandard : ContentPage
    {
        public ObservableCollection<string> Items { get; set; }

        public LFStandard()
        {
            InitializeComponent();
            
        }
    }
}
