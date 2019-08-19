import React from 'react';
import { StyleSheet, View, Button, Text, Image, TouchableOpacity } from 'react-native';

import ImagePicker from 'react-native-image-picker';


class NativeScreen extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            filePath: {},
        };
    }

    openCam() {
        var options = {
            storageOptions: {
              skipBackup: true,
              cameraRoll: true,
              waitUntilSaved:true
            }
          };
        ImagePicker.launchCamera(options, (response) => {
            console.log('Response = ', response);

            if (response.didCancel) {
                console.log('User cancelled image picker');
            } else if (response.error) {
                console.log('ImagePicker Error: ', response.error);
            } else if (response.customButton) {
                console.log('User tapped custom button: ', response.customButton);
            } else {
                let source = response;
                this.setState({
                    filePath: source,
                });
            }
        });
    }

    render() {
        return ( 
            <View accessible={true}>
                <Button onPress = {this.openCam.bind(this)}
				title = "Click me"/>
                <Image 
                    source={{uri:'data:image/jpeg;base64,' + this.state.filePath.data}}
                    style={ {width: 250, height: 250} }
                />
            </View>
        );
    }
}

export default NativeScreen;