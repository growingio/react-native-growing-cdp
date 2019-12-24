/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Button,
  NativeModules
} from 'react-native';

import {
  Colors
} from 'react-native/Libraries/NewAppScreen';

const App: () => React$Node = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          
          
          <View style={styles.body}>
            <View style={styles.sectionContainer}>
              
            <Button 
              title = "SDK Version"  
              onPress={() =>
                console.log(NativeModules.GrowingCDP.sdkVersion())
            }>
            </Button>

            <Button 
              title = "Enable GDPR"  
              onPress={() =>
                console.log(NativeModules.GrowingCDP.disableDataCollect())
            }>
            </Button>

            <Button 
              title = "Disable GDPR"  
              onPress={() =>
                console.log(NativeModules.GrowingCDP.enableDataCollect())
            }>
            </Button>

            <Button 
              title = "Set UserId"  
              onPress={() =>
                NativeModules.GrowingCDP.setUserId("userId")
            }>
            </Button>

            <Button 
              title = "Clean UserId"  
              onPress={() =>
                NativeModules.GrowingCDP.clearUserId()
            }>
            </Button>

            <Button 
              title = "Track Event"  
              onPress={() =>
                NativeModules.GrowingCDP.track("onHomeButonClicked", {name:"GrowingIO", title:"GrowingCDP"})
            }>
            </Button>

            <Button 
              title = "Set UserAttributes"  
              onPress={() =>
                NativeModules.GrowingCDP.setUserAttributes({name:"GrowingIO", project:"GrowingCDP"})
            }>
            </Button>

            <Button 
              title = "Set GeoLocation"  
              onPress={() =>
                NativeModules.GrowingCDP.setGeoLocation(0.0, 0.0)
            }>
            </Button>

            <Button 
              title = "Clean GeoLocation"  
              onPress={() =>
                NativeModules.GrowingCDP.clearGeoLocation()
            }>
            </Button>

          </View>
            
          </View>
        </ScrollView>
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
