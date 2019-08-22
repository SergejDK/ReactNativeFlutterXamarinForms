import React from 'react';
import { View, Button, Slider, Switch, TextInput, ProgressViewIOS, ProgressBarAndroid } from 'react-native';
import { createBottomTabNavigator } from 'react-navigation';

class SomeElements extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      language: String,
      active: Boolean
    };
  }

  render() {
    return (
      <View>
        <Button title="Button" />
        <TextInput
          style={{ height: 40, borderColor: 'gray', borderWidth: 1 }}
          testID="textField"
          placeholder="Placeholder"
        />
        <Slider/>
        <Switch
          value={this.state.active}
          onValueChange={(itemValue, itemIndex) =>
            this.setState({ active: itemValue })
          }
        />
        { Platform.OS === 'android' ? <ProgressBarAndroid progress={.25}/> : <ProgressViewIOS progress={.25}/> }
      </View>
    );
  }
}

const LookAndFeel = createBottomTabNavigator({
  Standard: SomeElements
});

export default LookAndFeel;
