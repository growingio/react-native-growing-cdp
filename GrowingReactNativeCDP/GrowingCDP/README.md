
# react-native-growing-cdp

## Getting started

`$ npm install react-native-growing-cdp --save`

### Mostly automatic installation

`$ react-native link react-native-growing-cdp`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-growing-cdp` and add `RNGrowingCdp.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGrowingCdp.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGrowingCdpPackage;` to the imports at the top of the file
  - Add `new RNGrowingCdpPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-growing-cdp'
  	project(':react-native-growing-cdp').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-growing-cdp/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-growing-cdp')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNGrowingCdp.sln` in `node_modules/react-native-growing-cdp/windows/RNGrowingCdp.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Growing.Cdp.RNGrowingCdp;` to the usings at the top of the file
  - Add `new RNGrowingCdpPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNGrowingCdp from 'react-native-growing-cdp';

// TODO: What to do with the module?
RNGrowingCdp;
```
  