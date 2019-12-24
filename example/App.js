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
              title = "Start Project"  
              onPress={() =>
                NativeModules.GrowingCDP.startWithProjectId("projectId", "dataSourceId")      
            }>
            </Button>
              
            <Button 
              title = "Set Track Host"  
              onPress={() =>
                NativeModules.GrowingCDP.setTrackerHost("host")      
            }>
            </Button>

            <Button 
              title = "Enable Debug Mode"  
              onPress={() =>
                NativeModules.GrowingCDP.setEnableDebugMode(true)      
            }>
            </Button>

            <Button 
              title = "Disable Debug Mode"  
              onPress={() =>
                NativeModules.GrowingCDP.setEnableDebugMode(false)      
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
