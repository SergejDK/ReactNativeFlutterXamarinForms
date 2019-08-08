import React from 'react';
import {
  StyleSheet,
  View,
  Button,
  Text,
  Image,
  TouchableOpacity
} from 'react-native';

class Barrierefreiheit extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      fontSizeOfText: 14
    };
  }

  scaleText(sign) {
    if (sign === '+') {
      this.setState({
        fontSizeOfText: (this.state.fontSizeOfText + 1)
      });
    } else if (sign === '-') {
      this.setState({
        fontSizeOfText: (this.state.fontSizeOfText - 1)
      });
    }
  }

  render() {
    return (
      <View>
        <Button
          title="Button BF Text"
          accessible={true}
          accessibilityLabel="Barrierefreiheit Button"
          accessibilityHint="Ein Hilfetext für die Barrierefreiheit des Buttons"
        />
        <Text
          accessible={true}
          accessibilityLabel="Barrierefreiheit Label"
          accessibilityHint="Ein Hilfetext für die Barrierefreiheit des Textes"
        >
          Label BF Text
        </Text>
        <Button title="Größer" onPress={() => this.scaleText('+')} />
        <Button title="Kleiner" onPress={() => this.scaleText('-')} />
        <Text style={{ fontSize: this.state.fontSizeOfText }}>
          Skalier mich
        </Text>
      </View>
    );
  }
}

export default Barrierefreiheit;
