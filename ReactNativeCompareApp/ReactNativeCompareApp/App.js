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
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png'
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
            uri:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/FH_Dortmund-logo.svg/1200px-FH_Dortmund-logo.svg.png'
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
  Native: {
    screen: createStackNavigator({
      Native: {
        screen: NativeScreen,
        navigationOptions: ({ navigation }) => ({
          title: 'Native',
          headerLeft: <LogoTitle navigationProps={navigation} />
        })
      }
    })
  },
  LookAndFeel: {
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
  Performance: {
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
