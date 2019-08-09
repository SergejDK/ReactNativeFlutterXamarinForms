/**
 * @format
 */

import 'react-native';
import React from 'react';
import App from '../App';
import { InfiniteList } from '../Performance';

// Note: test renderer must be required after react-native.
import renderer from 'react-test-renderer';

jest.mock('react-native-image-picker', () => {});

jest.mock('NativeModules', () => ({
  UIManager: {
    RCTView: () => {}
  },
  KeyboardObserver: {},
  RNGestureHandlerModule: {
    attachGestureHandler: jest.fn(),
    createGestureHandler: jest.fn(),
    dropGestureHandler: jest.fn(),
    updateGestureHandler: jest.fn(),
    State: {},
    Directions: {}
  }
}));

it('renders correctly', () => {
  renderer.create(<App />);
});

it('Unit Test', () => {
  const inf = new InfiniteList();
  const res = inf._g();
  jest.expect(res.length).toEqual(20);
});
