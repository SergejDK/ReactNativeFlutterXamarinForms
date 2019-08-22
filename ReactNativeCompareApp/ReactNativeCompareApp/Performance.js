import React from 'react';
import {
  StyleSheet,
  View,
  Button,
  Text,
  Image,
  TouchableOpacity,
  FlatList
} from 'react-native';
import { createBottomTabNavigator } from 'react-navigation';
import Geolocation from '@react-native-community/geolocation';

class GPSView extends React.Component {
  state = {
    longitude: null,
    latitude: null
  };

  getPos() {
    Geolocation.getCurrentPosition(
      success => {
        this.setState({
          longitude: success.coords.longitude,
          latitude: success.coords.latitude
        });
      },
      err => {
        console.log(err);
      },
      {
        enableHighAccuracy: true, timeout: 20000, maximumAge: 10000
      }
    );
  }

  componentDidMount() {
    //PermissionsAndroid.request(
    //	PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
    //	{
    //	  title: "Location Accessing Permission",
    //	  message: "App needs access to your location"
    //	}
    //);
    this.getPos();
  }

  // https://facebook.github.io/react-native/docs/geolocation#getcurrentposition
  render() {
    return (
      <View>
        <Text>Latitude: {this.state.latitude}</Text>
        <Text>Longitude: {this.state.longitude}</Text>
        <Button onPress={this.getPos()} title='Get Location'></Button>
      </View>
    );
  }
}

class InfiniteList extends React.Component {
  state = {
    data: [1, 2, 3, 4, 5, 6]
  };

  _g = () => {
    let r = [];
    for (let i = 1; i <= 20; i++) {
      r.push(i);
    }
    return r;
  };

  _generate = () => {
    this.setState((prev, next) => ({
      data: [...this.state.data, ...this._g()]
    }));
  };

  // https://scotch.io/tutorials/implementing-an-infinite-scroll-list-in-react-native
  render() {
    return (
      <FlatList
        data={this.state.data}
        renderItem={({ item }) => <Text>{item}</Text>}
        onEndReached={this._generate}
        onEndReachedThreshold={0.5}
        initialNumToRender={20}
      />
    );
  }
}

const PerformanceScreen = createBottomTabNavigator({
  Native: GPSView,
  List: InfiniteList
});

export { PerformanceScreen, InfiniteList };
