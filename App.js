import React, { Component } from 'react'
import { Platform, NativeModules, StyleSheet, View, AppState, Text, BackHandler, ScrollView } from "react-navite";

export default class App extends Component<Props> {
  constructor(props) {
    super(props);

  }
  render() {
    return (
      <Provider store={store}>
        <View style={styles.container}>
          <AppContainer
            ref={navigatorRef => {
              Utils.setTopLevelNavigator(navigatorRef);
            }}

            onNavigationStateChange={this._onNavigationStateChange}
          />
          <Toast
            ref={ref => {
              Utils.setToastRef(ref);
            }}
            style={{ marginHorizontal: 20 }}
            position='top'
          />
          <PopModal
            ref={ref => {
              Utils.setPopModalRef(ref);

            }}></PopModal>

        </View>
      </Provider>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  }
});