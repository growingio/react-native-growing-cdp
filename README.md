
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

#### Android 集成步骤  

> 说明：  
Gradle 编译环境：Android Studio  
支持系统版本：Android 4.2 - 10。对Android 4.2以下的手机设备不采集数据。

##### 1. 导入 SDK 

> 编辑文件 `app/build.gradle` 

添加 vds-android-agent 依赖：  


```groovy
android {
  dependencies{
    implementation "com.growingio.android:vds-android-agent:RN-cdp-1.0"
  }
}
```

##### 2. 初始化 SDK

> 编辑文件 `android/app/src/main/java/[...]/MainApplication.java`  

添加 SDK 初始化代码和 GrowingIOPackage :  


```java
import com.facebook.react.ReactPackage;
import com.growingio.android.plugin.rn.GrowingIOPackage;
import com.growingio.android.sdk.collection.Configuration;
import com.growingio.android.sdk.collection.GrowingIO;

public class MainApplication extends Application implements ReactApplication {

  public List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
        // 此处加入GrowingIO Package
          new GrowingIOPackage()
    );
  }

  @Override
  public void onCreate() {
    super.onCreate();
      // 在 onCreate 方法中初始化 GIO SDK
      GrowingIO.startWithConfiguration(this, new Configuration()
                      .setProjectId("您的项目ID")
                      .setURLScheme("您的 URL Scheme")
                      .setDataSourceId("您的数据源ID")
                      .setTestMode(BuildConfig.DEBUG)
                      .setDebugMode(BuildConfig.DEBUG)
                      .setTrackerHost("您的 Host 配置")
                      .setChannel("XXX应用商店")
      );
  }
}
```   

##### 3.添加应用权限  

> 编辑文件 `android/app/src/main/AndroidManifest.xml`    

将以下权限添加到你的 AndroidManifest.xml 中，其中 READ_PHONE_STATE 权限是可选的，需要用户主动申请，如果没有此权限将不能自动采集 imei 信息

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.example.cdpdemo">

    <!--    GIO 需要的权限  -->
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <!--    GIO 需要的权限  -->
       
</manifest>
```
  
##### 4.添加混淆文件  

如果你启用了混淆，请在你的 proguard-rules.pro 中加入如下代码：  

```
# GrowingIO 混淆文件
-keep class com.growingio.** {
    *;
}
-dontwarn com.growingio.**
-keepnames class * extends android.view.View
-keepnames class * extends android.app.Fragment
-keepnames class * extends android.support.v4.app.Fragment
-keepnames class * extends androidx.fragment.app.Fragment
-keep class android.support.v4.view.ViewPager{
    *;
}
-keep class android.support.v4.view.ViewPager$**{
	  *;
}
-keep class androidx.viewpager.widget.ViewPager{
    *;
}
-keep class androidx.viewpager.widget.ViewPager$**{
	  *;
}
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

#### Android 初始化配置API说明
初始化配置 API 在 Application 中初始化 GIO SDK 出使用。  

| API                | 默认值   | 是否必填 | 说明                                                                                                                           |
|--------------------|-------|------|------------------------------------------------------------------------------------------------------------------------------|
| setProjectId       | 无     | 是    | 设置 Project ID                                                                                                                |
| setDataSourceId    | 无     | 是    | 设置数据源 ID ；不同的部门看不同的数据，是企业数据平台的最基础的功能需求为了实现这个功能，计划在CDP产品中增加数据源ID的概念，每个事件在上报的时候，都需要指定一个数据源ID后续会根据数据源ID来定义每个用户能够查看、使用哪些事件、标签的数据 |
| setURLScheme       | 无     | 是    | 设置 URLScheme , 是应用唯一标识                                                                                                       |
| setDebugMode       | false | 否    | 在Logcat中输出采集日志                                                                                                               |
| setTestMode        | false | 否    | 实时发送数据，开启则不遵循移动网络状态下数据发送大小默认 3M 限制以及采集数据缓存30秒发送策略。为了方便开发者查看日志，一般和setDebugMode一起使用。                                           |
| setChannel         | 无     | 否    | 设置App下载渠道                                                                                                                    |
| setImeiEnable      | true  | 否    | 为了海外应用市场上架应用，设置为 false 则 SDK 不采集 imei 。                                                                                      |
| setAndroidIdEnable | true  | 否    | 为了海外应用市场上架应用，设置为 false 则 SDK 不采集 Android ID 。                                                                                |



#### 示例代码

在对应原生工程里面进行初始化配置,代码示例如下

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

