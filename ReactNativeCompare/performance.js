import React from 'react';
import { StyleSheet, View, Button, Text, Image, TouchableOpacity, FlatList } from 'react-native';
import { createBottomTabNavigator } from "react-navigation";
import { Grayscale } from 'react-native-color-matrix-image-filters';
import {PermissionsAndroid} from 'react-native';
import Geolocation from '@react-native-community/geolocation';

const styles = StyleSheet.create({
  bigBlue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
	color: 'hsla(360, 100%, 100%, 1.0)',
	width: 150,
	height: 150,
  },
  
});

class BlackWhite extends React.Component {

// https://github.com/iyegoroff/react-native-color-matrix-image-filters use this with cli

	render() {
		return (
			<View>
				<Image source={{ uri: 'https://www.w3schools.com/w3css/img_lights.jpg' }} 
					style = {{ width: 150, height: 150, }}
				/>
				<Grayscale>
					<Image source={{ uri: 'https://www.w3schools.com/w3css/img_lights.jpg' }} 
						style = {{ width: 150, height: 150, }} />
				</Grayscale>
			</View>
		)
	}
}

class GPSView extends React.Component {

	state = {
		longitude: null,
		latitude: null,
	}

	componentDidMount() {
		//PermissionsAndroid.request(
		//	PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
		//	{
		//	  title: "Location Accessing Permission",
		//	  message: "App needs access to your location"
		//	}
		//);
		Geolocation.getCurrentPosition(
			(success) => {
				this.setState(
					{longitude: success.coords.longitude,
					latitude: success.coords.latitude}
				)
			},
			(err) => {console.log(err);}
		);
	}

	// https://facebook.github.io/react-native/docs/geolocation#getcurrentposition
	render(){
		return (
			<View>
				<Text>Latitude: {this.state.latitude}</Text>
				<Text>Longitude: {this.state.longitude}</Text>
			</View>
		)
	}
}

class InfiniteList extends React.Component {
	
	state = {
		data: [1,2,3,4,5,6],
    };
	
	_g = () => {
		let r = [];
		for(let i = 0; i <= 20; i++) {
			r.push(i);
		}
		return r;
    };
    
    _generate = () => {
		this.setState(
			(prev, next) => ({
				data: [...this.state.data, ...this._g()]
			})
		)
	};
	
	// https://scotch.io/tutorials/implementing-an-infinite-scroll-list-in-react-native
	render(){
		return (
			<FlatList 
				data={this.state.data}
				renderItem={ ({item}) => (
					<Text>{item}</Text>
				)}
				onEndReached={this._generate}
				onEndReachedThreshold={0.5}
				initialNumToRender={20}
			/>		
		)
			
	}
}

const PerformanceScreen = createBottomTabNavigator({
	Image: BlackWhite,
	Native: GPSView,
	List: InfiniteList
});

export default PerformanceScreen;