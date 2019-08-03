using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;

namespace XamarinFormsCompareApp.Classes
{
    public class PerfList : INotifyPropertyChanged, INotifyCollectionChanged
    {

        public const int ItemsToAdd = 20;

        public event PropertyChangedEventHandler PropertyChanged;
        public event NotifyCollectionChangedEventHandler CollectionChanged;

        //public event NotifyCollectionChangedEventHandler CollectionChanged;

        ObservableCollection<int> _itemsList;

        public ObservableCollection<int> ItemsList
        {
            get { return _itemsList; }
            private set {
                _itemsList = value;
                //PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("ItemsList"));
                //CollectionChanged(this, new NotifyCollectionChangedEventArgs(NotifyCollectionChangedAction.Add));
            }
        }

        string _tt;
        public string TimerText {
            get { return _tt; }
            private set {
                _tt = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("TimerText"));
            }
        }

        public PerfList()
        {
            _itemsList = new ObservableCollection<int>();
            _itemsList.CollectionChanged += (s, e) =>
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("ItemsList"));
                CollectionChanged?.Invoke(this, new NotifyCollectionChangedEventArgs(NotifyCollectionChangedAction.Add, ItemsList));
            };
            generate();
        }

        public void generate()
        {
            var watch = System.Diagnostics.Stopwatch.StartNew();
            var l = new List<int>();
            for (int i = 1; i <= ItemsToAdd; i++)
            {
                _itemsList.Add(i);
            }
            watch.Stop();
            TimerText = TimerText + $" || {watch.Elapsed}";
        }
    }
}
