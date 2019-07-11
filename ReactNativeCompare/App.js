/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
import React from 'react';
import { StyleSheet, View, Button, Text, Image, TouchableOpacity } from 'react-native';
import { createStackNavigator, createAppContainer, createDrawerNavigator } from "react-navigation";
import PerformanceScreen from './performance';
import NativeScreen from './native';

class LogoTitle extends React.Component {

  toggleDrawer = () => {
      this.props.navigationProps.toggleDrawer();
  };

  render() {
      return ( 
    <View style = {{ flexDirection: 'row' }}>
      <TouchableOpacity onPress = {this.toggleDrawer.bind(this)}>
        <Image source = {{ uri: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png' }}
          style = {{ width: 30, height: 30, }}/> 
      </TouchableOpacity> 
    </View >
      );
  }
}


class MyHomeScreen extends React.Component {

  render() {
      return ( 
    <Button onPress = {() => this.props.navigation.navigate('Notifications')}
      title = "Go to notifications" />
      );
  }
}

class MyNotificationsScreen extends React.Component {
  render() {
      return ( 
    <Button onPress = {() => this.props.navigation.navigate('Home')}
      title = "Go back home" />
      );
  }
}

const MyDrawerNavigator = createDrawerNavigator({
  Home: {
      screen: createStackNavigator({
          Home: {
              screen: MyHomeScreen,
              navigationOptions: ({ navigation }) => ({
                  title: 'Title1',
                  headerLeft: <LogoTitle navigationProps = {navigation}/>,
                  headerStyle: {
                      backgroundColor: '#FF9800',
                  },
                  headerTintColor: '#fff',
              }),
          },
      }),
  },
  Notifications: {
      screen: createStackNavigator({
          Notifications: {
              screen: MyNotificationsScreen,
              navigationOptions: ({ navigation }) => ({
                  title: 'Title2',
                  headerLeft: <LogoTitle navigationProps = {navigation}/>,
                  headerStyle: {
                      backgroundColor: '#FF9800',
                  },
                  headerTintColor: '#fff',
              }),
          },
      }),
  },
  Performance: {
		screen: createStackNavigator ({
			Performance: {
				screen: PerformanceScreen,
                navigationOptions: ({ navigation }) => ({
                    title: 'Performance',
                    headerLeft: <LogoTitle navigationProps = {navigation}/>,
                    headerStyle: {
                        backgroundColor: '#FF9800',
                    },
                    headerTintColor: '#fff',
                }),
			},
		}),
	},
	Native: {
		screen: createStackNavigator ({
			Native: {
				screen: NativeScreen,
				navigationOptions: ({ navigation }) => ({
					title: 'Native',
					headerLeft: <LogoTitle navigationProps = {navigation}/>,
					headerStyle: {
						backgroundColor: '#FF9800',
					},
					headerTintColor: '#fff',
				}),
			},
		}),
	},
});

const AppContainer = createAppContainer(MyDrawerNavigator);

const App = () => {
  return (
    <AppContainer></AppContainer>
  );
};

const styles = StyleSheet.create({
  
});

export default App;
