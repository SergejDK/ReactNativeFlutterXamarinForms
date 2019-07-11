import React from 'react';
import { StyleSheet, View, Button, Text, Image, TouchableOpacity } from 'react-native';
import { createStackNavigator, createAppContainer, createDrawerNavigator, NavigationDrawerStructure } from "react-navigation";

class NativeScreen extends React.Component {
    render() {
        return ( 
			<Button onPress = {() => this.props.navigation.navigate('Home')}
				title = "Go back home" />
        );
    }
}

export default NativeScreen;