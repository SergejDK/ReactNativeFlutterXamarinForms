import React from 'react';
import { StyleSheet, View, Button, Text, Image, TouchableOpacity } from 'react-native';
import { createStackNavigator, createAppContainer, createDrawerNavigator, NavigationDrawerStructure } from "react-navigation";

class LogoTitle extends React.Component {

  toggleDrawer = () => {
    this.props.navigationProps.toggleDrawer();
  };

  render() {
    return (
      <View style={{ flexDirection: 'row' }}>
        <TouchableOpacity onPress={this.toggleDrawer.bind(this)}>
          <Image
            source={{uri: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png'}}
            style={{ width: 30, height: 30,  }}
          />
        </TouchableOpacity>
        <Text>
          {this.props.dTitle}
        </Text>
      </View>
    );
  }
}

class MyHomeScreen extends React.Component {

  render() {
    return (
      <Button
        onPress={() => this.props.navigation.navigate('Notifications')}
        title="Go to notifications"
      />
    );
  }
}

class MyNotificationsScreen extends React.Component {
  static navigationOptions = {
    drawerLabel: 'Notifications',
    headerTitle: <LogoTitle dTitle='HomeScreen'></LogoTitle>
  };

  render() {
    return (
      <Button
        onPress={() => this.props.navigation.goBack()}
        title="Go back home"
      />
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
          headerLeft: <LogoTitle navigationProps={navigation} />,
          headerStyle: {
            backgroundColor: '#FF9800',
          },
          headerTintColor: '#fff',
        }),
      },
    }),
  },
  Notifications: {
    screen: MyNotificationsScreen,
  },
  
});

const AppContainer = createAppContainer(MyDrawerNavigator);

export default function App() {
  return (
    <AppContainer></AppContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
