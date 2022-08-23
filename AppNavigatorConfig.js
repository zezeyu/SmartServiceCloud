import React, { Component } from 'react';
import { NativeModules, Image, TouchableOpacity, Text, Platform } from 'react-native';
import { composeWithDevTools } from 'remote-redux-devtools';

import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import thunk from 'redux-thunk';
import { createStore, applyMiddleware, combineReducers } from 'redux';
import Logger from 'cpclog';

import { connect } from 'react-redux';

function mapStateToProps(state) {
    return {

    };
}

function mapDispatchToProps(dispatch) {
    return {

    };
}

class AppNavigatorConfig extends Component {
    render() {
        return (
            <div>
                
            </div>
        );
    }
}

export default connect(
    mapStateToProps,
)(AppNavigatorConfig);