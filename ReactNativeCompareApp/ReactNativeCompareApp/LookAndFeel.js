import React from 'react';
import { View, Button, Text, Switch, Picker, TextInput } from 'react-native';
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
        <Button title="EinButton" />
        <Text>Ein Text</Text>
        <Switch
          value={this.state.active}
          onValueChange={(itemValue, itemIndex) =>
            this.setState({ active: itemValue })
          }
        />
        <Picker
          selectedValue={this.state.language}
          style={{ height: 50, width: 100 }}
          onValueChange={(itemValue, itemIndex) =>
            this.setState({ language: itemValue })
          }
        >
          <Picker.Item label="Java" value="java" />
          <Picker.Item label="JavaScript" value="js" />
        </Picker>
        <TextInput
          style={{ height: 40, borderColor: 'gray', borderWidth: 1 }}
          testID="textField"
        />
      </View>
    );
  }
}

const LookAndFeel = createBottomTabNavigator({
  Standard: SomeElements
});

export default LookAndFeel;
