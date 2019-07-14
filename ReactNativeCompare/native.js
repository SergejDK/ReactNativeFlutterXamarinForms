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
            title: 'Select Avatar',
            customButtons: [{ name: 'fb', title: 'Choose Photo from Facebook' }],
            storageOptions: {
              skipBackup: true,
              path: 'images',
            },
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
                //const source = { uri: response.uri };
                let source = response;
                // You can also display the image using data:
                // const source = { uri: 'data:image/jpeg;base64,' + response.data };

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
				title = "Take Picture" accessible={true} accessibilityLabel="Take Picture"/>
                <Image 
                    source={{uri:'data:image/jpeg;base64,' + this.state.filePath.data}}
                    style={ {width: 250, height: 250} }
                    accessible={true}
                    accessibilityLabel="Image taken" 
                    accessibilityHint="The image you took a sec before"
                />
            </View>
        );
    }
}

export default NativeScreen;