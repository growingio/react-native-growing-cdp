
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
#### 4.1 `NativeModules.GrowingCDP.sdkVersion`

获取SDK版本信息

#### 4.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无|获取SDK版本信息

#### 4.3 代码示例
```javascript
NativeModules.GrowingCDP.setEnableDebugMode(true)
```

---

### 5 设置URL Scheme
#### 5.1 `NativeModules.GrowingCDP.setUrlScheme("YOUR_URL_SCHEME")`

设置项目URL Scheme

#### 5.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
urlScheme|string|是|无| 项目 URL Scheme

#### 5.3 代码示例
```javascript
NativeModules.GrowingCDP.setUrlScheme("url scheme")
```

---

### 6 获取URL Scheme
#### 6.1 `NativeModules.GrowingCDP.getUrlScheme()`

获取用户设置的项目URL Scheme

#### 6.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 获取项目 URL Scheme

#### 6.3 代码示例
```javascript
NativeModules.GrowingCDP.getUrlScheme()
```

---

### 7 设置 GDPR 生效
#### 7.1 `NativeModules.GrowingCDP.disableDataCollect()`

欧盟通用数据保护条例（GDPR），旨在协调整个欧洲的数据隐私法律，保护所有欧盟公民的数据隐私

#### 7.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 设置 GDPR 生效

#### 7.3 代码示例
```javascript
NativeModules.GrowingCDP.disableDataCollect()
```

---

### 8 设置 GDPR 生效
#### 8.1 `NativeModules.GrowingCDP.enableDataCollect()`

欧盟通用数据保护条例（GDPR），旨在协调整个欧洲的数据隐私法律，保护所有欧盟公民的数据隐私

#### 8.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 设置 GDPR 失效

#### 8.3 代码示例
```javascript
NativeModules.GrowingCDP.enableDataCollect()
```

---

### 9 设置 userId
#### 9.1 `NativeModules.GrowingCDP.setUserId("YOUR_USER_ID")`

登陆用户ID, ID为正常英文数字组合的字符串, 长度<=1000, 请不要含有 "'|\*&$@/', 等特殊字符

#### 9.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
userId|string|是|无| 设置登录用户 userId 不允许传空或者nil, 如有此操作请调用clearUserId函数

#### 9.3 代码示例
```javascript
NativeModules.GrowingCDP.setUserId("userId")
```

---

### 10 清除 userId
#### 10.1 `NativeModules.GrowingCDP.clearUserId()`

清除登录用户ID

#### 10.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 清除登录用户ID

#### 10.3 代码示例
```javascript
NativeModules.GrowingCDP.clearUserId()
```

---

### 11 发送自定义事件
#### 11.1 `NativeModules.GrowingCDP.track("YOUR_EVENT_ID", {"greet": "hello GrowingIO"})`

发送自定义事件

#### 11.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
eventId|string|是|无| 事件Id, Id为正常英文数字组合的字符串, 长度<=1000, 请不要含有 '\*&$@/', 等特殊字符
eventId|string|是|无| 事件Id, Id为正常英文数字组合的字符串, 长度<=1000, 请不要含有 '\*&$@/', 等特殊字符

#### 11.3 代码示例
```javascript
NativeModules.GrowingCDP.track("onHomeButonClicked", {"greet": "hello GrwoingIO"})
```

---


## Android 特有的 API

### 1 设置App下载渠道
#### 1.1 `NativeModules.GrowingCDP.setChannel("YOUR_APP_DOWNLOAD_CHANNEL")`

设置App下载渠道

#### 1.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
channel|string|是|无| 设置App下载渠道

#### 1.3 代码示例
```javascript
NativeModules.GrowingCDP.setChannel("HuaWei")
```

---

### 2 设置是否采集 imei
#### 2.1 `NativeModules.GrowingCDP.setImeiEnable(true)`

为了海外应用市场上架应用，是否采集 imei

#### 2.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
enable|boolean|是|无| 设置为 false 则 SDK 不采集 imei 

#### 2.3 代码示例
```javascript
NativeModules.GrowingCDP.setImeiEnable(true)
```

---

### 3 设置是否采集 Android ID 
#### 3.1 `NativeModules.GrowingCDP.setAndroidIdEnable(true)`

为了海外应用市场上架应用，是否采集 Android ID 

#### 3.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
enable|boolean|是|无| 设置为 false 则 SDK 不采集 Android ID 

#### 3.3 代码示例
```javascript
NativeModules.GrowingCDP.setAndroidIdEnable(true)
```

---

### 4 设置经纬度 
#### 4.1 `NativeModules.GrowingCDP.setGeoLocation(0.0, 0.0)`

设置经纬度，并在 vst 事件中发送，Android SDK 暂时没办法自动获取GPS数据，如果您要采集GPS数据，需要在您的App每次获取完GPS数据之后，通过该API告知 SDK。如果您不设置，我们默认使用用户IP的Location

#### 4.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
lat|double|是|无| 经度
lng|double|是|无| 纬度

#### 4.3 代码示例
```javascript
NativeModules.GrowingCDP.setGeoLocation(0.0, 0.0)
```

---

### 5 清空经纬度
#### 5.1 `NativeModules.GrowingCDP.clearGeoLocation()`

清空经纬度

#### 5.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 清空经纬度

#### 5.3 代码示例
```javascript
NativeModules.GrowingCDP.clearGeoLocation()
```

---