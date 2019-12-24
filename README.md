
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

RNGrowingCdp;
```

## API 说明

### 1 初始化SDK
#### 1.1 `NativeModules.GrowingCDP.startWithProjectId("YOUR_PROJECT_ID", "YOUR_DATASOURCE_ID")`

初始化 SDK，设置项目ID和数据源ID

#### 1.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
projectId|string|是|无|项目ID
dataSourceId|string|是|无|数据源ID

#### 1.3 代码示例
```javascript
NativeModules.GrowingCDP.startWithProjectId("projectId", "dataSourceId")
```

---

### 2 设置数据收集平台服务器地址
#### 2.1 `NativeModules.GrowingCDP.setTrackerHost("YOUR_TRACK_HOST")`

设置私部服务地址，例如：http://www.growingio.com

#### 2.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
host|string|是|无|私部服务的地址

#### 2.3 代码示例
```javascript
NativeModules.GrowingCDP.setTrackerHost("host")
```

---

### 3 采集日志开关
#### 3.1 `NativeModules.GrowingCDP.setEnableDebugMode(true)`

采集日志开关，为true时，会输出调试日志。

#### 3.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
enable|boolean|是|false|是否打开输出调试日志

#### 3.3 代码示例
```javascript
NativeModules.GrowingCDP.setEnableDebugMode(true)
```

---

### 4 获取SDK版本
#### 3.1 `NativeModules.GrowingCDP.sdkVersion`

获取SDK版本信息

#### 3.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|string|无|获取SDK版本信息

#### 3.3 代码示例
```javascript
NativeModules.GrowingCDP.setEnableDebugMode(true)
```

---