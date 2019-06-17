/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { View, Platform, StyleSheet } from 'react-native';
import NavigationDrawerStructure, { createDrawerNavigator,createAppContainer, createStackNavigator } from 'react-navigation'
import { Button,Container,Header,Left,Right,Icon,Text } from 'native-base';
import NativeScreen from './screens/nativescreen';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

class MyHomeScreen extends Component {
  render() {
    return (
      <Container>
        <Header>
          <Left style={{ flexDirection: 'row'}}>
           <Icon onPress={() => this.props.navigation.openDrawer()} name="md-menu" style={{ color: 'white', marginRight: 15 }} />
          </Left>
          <Right>
           <Icon name="md-cart" style={{ color: 'white' }} />
          </Right>
        </Header>
       <View style={{ marginTop:100,marginLeft:100}}>
         <Button onPress={() => this.props.navigation.navigate('Notifications')} >
           <Text>Go to notifications</Text>
         </Button>
        </View>
       </Container>
     );
   }
 }


class MyNotificationsScreen extends React.Component {
  render() {
    return (
      <View style={{ marginTop:100,marginLeft:100}}>
        <Button onPress={() => this.props.navigation.goBack()} >
          <Text>Go back home</Text>
        </Button>
      </View>
    );
   }
}

const Native_StackNavigator = createStackNavigator({
  //All the screen from the Screen3 will be indexed here
  Third: {
    screen: NativeScreen,
    navigationOptions: ({ navigation }) => ({
      title: 'Native Screen',
      //headerLeft: <NavigationDrawerStructure navigationProps={navigation} />,
      headerStyle: {
        backgroundColor: '#FF9800',
      },
      headerTintColor: '#fff',
      headerMode: 'screen',
    }),
  },
});

const MyDrawerNavigator = createDrawerNavigator({
  Home:{ 
     screen: MyHomeScreen,
  },
  Notifications: {
     screen: MyNotificationsScreen,
     navigationOptions: {
       drawerLabel: 'Notifications'
     }
  },
  Native: {
    screen: Native_StackNavigator,
  }
});

const MyApp = createAppContainer(MyDrawerNavigator);

type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
      <Container>
        <MyApp></MyApp >
      </Container>
    );
  }
  
}
