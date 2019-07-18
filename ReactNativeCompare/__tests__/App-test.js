/**
 * @format
 */

import 'react-native';
import React from 'react';
import App from '../App';
import { NativeModules } from "react-native";
// Note: test renderer must be required after react-native.
import renderer from 'react-test-renderer';

NativeModules.RNGestureHandlerModule = {};

it('renders correctly', () => {
  const tree = renderer.create(<App />).toJSON();
  expect(tree).toMatchSnapshot();
});
