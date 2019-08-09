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
import { Grayscale } from 'react-native-color-matrix-image-filters';
import Geolocation from '@react-native-community/geolocation';
const Profiler = React.unstable_Profiler;

class BlackWhite extends React.Component {
  // https://github.com/iyegoroff/react-native-color-matrix-image-filters use this with cli

  state = {
    nt: String
  };

  logMeasurement = (id, phase, actualDuration, baseDuration) => {
    // see output during DEV
    this.nt = baseDuration;
  };

  shouldComponentUpdate(nextProps, nextState) {
    if (nextState.nt !== '') return true;
    else return false;
  }

  bt = null;
  getNormalImage() {
    var img = (
      <Image
        source={{ uri: 'https://www.w3schools.com/w3css/img_lights.jpg' }}
        style={{ width: 150, height: 150 }}
      />
    );
    return img;
  }

  getBWImage() {
    var startDate = Date.now();
    var img = (
      <Grayscale>
        <Image
          source={{ uri: 'https://www.w3schools.com/w3css/img_lights.jpg' }}
          style={{ width: 150, height: 150 }}
        />
      </Grayscale>
    );
    var enddate = Date.now();
    this.bt = enddate - startDate;
    return img;
  }

  render() {
    //var ni = this.getNormalImage();
    //var bi = this.getBWImage();
    return (
      <View>
        <Profiler id="o" onRender={this.logMeasurement}>
          <Image
            source={{ uri: 'https://www.w3schools.com/w3css/img_lights.jpg' }}
            style={{ width: 150, height: 150 }}
          />
          <Text>Normal: {this.nt}</Text>
        </Profiler>

        <Text>Grayscale: {this.bt} </Text>
      </View>
    );
  }
}

class GPSView extends React.Component {
  state = {
    longitude: null,
    latitude: null
  };

  componentDidMount() {
    //PermissionsAndroid.request(
    //	PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
    //	{
    //	  title: "Location Accessing Permission",
    //	  message: "App needs access to your location"
    //	}
    //);
    Geolocation.getCurrentPosition(
      success => {
        this.setState({
          longitude: success.coords.longitude,
          latitude: success.coords.latitude
        });
      },
      err => {
        console.log(err);
      }
    );
  }

  // https://facebook.github.io/react-native/docs/geolocation#getcurrentposition
  render() {
    return (
      <View>
        <Text>Latitude: {this.state.latitude}</Text>
        <Text>Longitude: {this.state.longitude}</Text>
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
  Image: BlackWhite,
  Native: GPSView,
  List: InfiniteList
});

export { PerformanceScreen, InfiniteList };
