
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

### 1 初始化配置

在对应原生工程里面进行初始化配置

[Android](https://github.com/growingio/react-native-growing-cdp/tree/master/example/android)

[iOS](https://github.com/growingio/react-native-growing-cdp/tree/master/example/ios)

---

### 2 获取SDK版本
#### 2.1 `NativeModules.GrowingCDP.sdkVersion`

获取SDK版本信息

#### 2.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无|获取SDK版本信息

#### 2.3 代码示例
```javascript
NativeModules.GrowingCDP.sdkVersion()
```

---

---

### 3 设置 GDPR 生效
#### 3.1 `NativeModules.GrowingCDP.disableDataCollect()`

欧盟通用数据保护条例（GDPR），旨在协调整个欧洲的数据隐私法律，保护所有欧盟公民的数据隐私

#### 3.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 设置 GDPR 生效

#### 3.3 代码示例
```javascript
NativeModules.GrowingCDP.disableDataCollect()
```

---

### 4 设置 GDPR 失效
#### 4.1 `NativeModules.GrowingCDP.enableDataCollect()`

欧盟通用数据保护条例（GDPR），旨在协调整个欧洲的数据隐私法律，保护所有欧盟公民的数据隐私

#### 4.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 设置 GDPR 失效

#### 4.3 代码示例
```javascript
NativeModules.GrowingCDP.enableDataCollect()
```

---

### 5 设置 userId
#### 5.1 `NativeModules.GrowingCDP.setUserId("YOUR_USER_ID")`

登陆用户ID, ID为正常英文数字组合的字符串, 长度<=1000, 请不要含有 "'|\*&$@/', 等特殊字符

#### 5.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
userId|string|是|无| 设置登录用户 userId 不允许传空或者nil, 如有此操作请调用clearUserId函数

#### 5.3 代码示例
```javascript
NativeModules.GrowingCDP.setUserId("userId")
```

---

### 6 清除 userId
#### 6.1 `NativeModules.GrowingCDP.clearUserId()`

清除登录用户ID

#### 6.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 清除登录用户ID

#### 6.3 代码示例
```javascript
NativeModules.GrowingCDP.clearUserId()
```

---

### 7 设置经纬度 
#### 7.1 `NativeModules.GrowingCDP.setGeoLocation(0.0, 0.0)`

设置经纬度，并在 vst 事件中发送，Android SDK 暂时没办法自动获取GPS数据，如果您要采集GPS数据，需要在您的App每次获取完GPS数据之后，通过该API告知 SDK。如果您不设置，我们默认使用用户IP的Location

#### 7.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
lat|double|是|无| 经度
lng|double|是|无| 纬度

#### 7.3 代码示例
```javascript
NativeModules.GrowingCDP.setGeoLocation(0.0, 0.0)
```

---

### 8 清空经纬度
#### 8.1 `NativeModules.GrowingCDP.clearGeoLocation()`

清空经纬度

#### 8.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 清空经纬度

#### 8.3 代码示例
```javascript
NativeModules.GrowingCDP.clearGeoLocation()
```

---

### 9 发送自定义事件
#### 9.1 `NativeModules.GrowingCDP.track("YOUR_EVENT_ID", {"greet": "hello GrowingIO"})`

发送自定义事件

#### 9.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
eventId|string|是|无| 事件Id, Id为正常英文数字组合的字符串, 长度<=1000, 请不要含有 '\*&$@/', 等特殊字符
variable|object|是|无| 事件发生时所伴随的维度信息，限制：不能为 nil；variable 内部不允许含有JSONObject或者JSONArray；

#### 9.3 代码示例
```javascript
NativeModules.GrowingCDP.track("onHomeButonClicked", {"greet": "hello GrwoingIO"})
```

---

### 10 发送自定义的用户事件
#### 10.1 `NativeModules.GrowingCDP.setUserAttributes({"greet": "hello GrowingIO"})`

发送一个自定义的用户事件

#### 10.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
eventId|string|是|无| 事件Id, Id为正常英文数字组合的字符串, 长度<=1000, 请不要含有 '\*&$@/', 等特殊字符

#### 10.3 代码示例
```javascript
NativeModules.GrowingCDP.setUserAttributes({"name": "GrowingIO", "title": "Senior Engineer"})
```

---

### 11 获取当前设备 ID
#### 11.1 `NativeModules.GrowingCDP.getDeviceId()`

获取当前设备 ID

#### 11.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 获取当前设备 ID

#### 11.3 代码示例
```javascript
NativeModules.GrowingCDP.getDeviceId()
```

---

### 12 获取当前访问用户 ID
#### 11.1 `NativeModules.GrowingCDP.getVisitUserId()`

获取当前访问用户 ID

#### 11.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 获取当前访问用户 ID

#### 11.3 代码示例
```javascript
NativeModules.GrowingCDP.getVisitUserId()
```

---


### 13 获取当前访问 ID
#### 13.1 `NativeModules.GrowingCDP.getSessionId()`

获取当前访问 ID

#### 13.2 参数说明
参数名|类型|必填|默认值|说明
:---:|:---:|:---:|:---:|:---:
无|无|无|无| 获取当前访问 ID

#### 13.3 代码示例
```javascript
NativeModules.GrowingCDP.getSessionId()
```

---