/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
import React from 'react';
import {
  StyleSheet,
  View,
  Button,
  Text,
  Image,
  TouchableOpacity
} from 'react-native';
import {
  createStackNavigator,
  createAppContainer,
  createDrawerNavigator
} from 'react-navigation';
import NativeScreen from './NativePage';
import LookAndFeel from './LookAndFeel';
import { PerformanceScreen } from './Performance';
import Barrierefreiheit from './Barrierefreiheit';

class LogoTitle extends React.Component {
  toggleDrawer = () => {
    this.props.navigationProps.toggleDrawer();
  };

  render() {
    return (
      <View style={{ flexDirection: 'row' }}>
        <TouchableOpacity
          onPress={this.toggleDrawer.bind(this)}
          testID="navDrawerOpen"
        >
          <Image
            source={{
              uri:
                'https://cdn4.iconfinder.com/data/icons/general-office-solid-style/91/General_-_Office_30-512.png'
            }}
            style={{ width: 30, height: 30 }}
          />
        </TouchableOpacity>
      </View>
    );
  }
}

class MyHomeScreen extends React.Component {
  render() {
    return (
      <View>
        <Image
          source={{
            uri: 'https://facebook.github.io/react/logo-og.png'
          }}
          style={{ width: '100%', height: 250, resizeMode: 'contain' }}
        />
        <Text>
          Vergleich von Mobile App Frameworks zur Cross-Platform Entwicklung
        </Text>
      </View>
    );
  }
}

const MyDrawerNavigator = createDrawerNavigator({
  Home: {
    screen: createStackNavigator({
      Home: {
        screen: MyHomeScreen,
        navigationOptions: ({ navigation }) => ({
          title: 'Home',
          headerLeft: <LogoTitle navigationProps={navigation} />
        })
      }
    })
  },
  'Native Funktionalität': {
    screen: createStackNavigator({
      Native: {
        screen: NativeScreen,
        navigationOptions: ({ navigation }) => ({
          title: 'Native Funktionalität',
          headerLeft: <LogoTitle navigationProps={navigation} />
        })
      }
    })
  },
  'Look and Feel': {
    screen: createStackNavigator({
      LookAndFeel: {
        screen: LookAndFeel,
        navigationOptions: ({ navigation }) => ({
          title: 'Look and Feel',
          headerLeft: <LogoTitle navigationProps={navigation} />
        })
      }
    })
  },
  Performanz: {
    screen: createStackNavigator({
      Performance: {
        screen: PerformanceScreen,
        navigationOptions: ({ navigation }) => ({
          title: 'Performanz',
          headerLeft: <LogoTitle navigationProps={navigation} />
        })
      }
    })
  },
  Barrierefreiheit: {
    screen: createStackNavigator(
      {
        Barrierefreiheit: {
          screen: Barrierefreiheit,
          navigationOptions: ({ navigation }) => ({
            title: 'Barrierefreiheit',
            headerLeft: <LogoTitle navigationProps={navigation} />,
            headerStyle: {
              backgroundColor: '#FF9800'
            },
            headerTintColor: '#fff'
          })
        }
      },
      {
        cardStyle: { backgroundColor: 'lightblue' }
      }
    )
  }
});

const AppContainer = createAppContainer(MyDrawerNavigator);

class App extends React.Component {
  render() {
    return <AppContainer />;
  }
}

export default App;
