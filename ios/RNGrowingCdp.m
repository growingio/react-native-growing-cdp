
#import "RNGrowingCdp.h"
#import "Growing.h"

@implementation RNGrowingCdp

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(GrowingCDP);

#pragma mark SDK 功能 API

/// 初始化SDK
/// @param projectId 项目ID
/// @param dataSourceId 数据源ID
+ (void)startWithProjectId:(NSString *)projectId dataSourceId:(NSString *)dataSourceId {
    [Growing startWithAccountId:projectId dataSourceId:dataSourceId];
}

/// 设置数据收集平台服务器地址
/// @param host 私部的域名
+ (void)setTrackerHost:(NSString *)host {
    [Growing setTrackerHost:host];
}

/// 命令行输出调试日志，默认为NO
/// @param enable 是否打开日志
+ (void)setEnableDebugMode:(BOOL)enable {
    [Growing setEnableLog:enable];
}

/// 设置发送数据的时间间隔（单位为秒）
/// @param interval 时间间隔
+ (void)setFlushInterval:(NSTimeInterval)interval {
    [Growing setFlushInterval:interval];
}

+ (void)setDailyDataLimit:(NSUInteger)limit {
    [Growing setDailyDataLimit:limit];
}

+ (NSUInteger)getDailyDataLimit {
    return [Growing getDailyDataLimit];
}

#pragma mark Bridge to RN

RCT_REMAP_METHOD(sdkVersion,
                 sdkVersionResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *version = [Growing sdkVersion];
    resolve(version);
}

RCT_REMAP_METHOD(getDeviceId,
                 deviceIdResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *deviceId = [Growing getDeviceId];
    resolve(deviceId);
}

RCT_REMAP_METHOD(getVisitUserId,
                 visitUserResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *visitUserId = [Growing getVisitUserId];
    resolve(visitUserId);
}

RCT_REMAP_METHOD(getSessionId,
                 sessionIdResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *sessionId = [Growing getSessionId];
    resolve(sessionId);
}

#pragma mark 数据采集发送API

/// 设置 GDPR 生效
RCT_EXPORT_METHOD(disableDataCollect) {
    [Growing disableDataCollect];
}

/// 设置 GDPR 失效
RCT_EXPORT_METHOD(enableDataCollect) {
    [Growing enableDataCollect];
}


#pragma mark 自定义数据上传API

/// 设置登录用户ID
/// @param userId 登陆用户ID, ID为正常英文数字组合的字符串, 长度<=1000, 请不要含有 "'|\*&$@/', 等特殊字符
/// ！！！不允许传空或者nil, 如有此操作请调用clearUserId函数
RCT_EXPORT_METHOD(setUserId:(NSString *)userId) {
    [Growing setUserId:userId];
}

/// 清除登录用户ID
RCT_EXPORT_METHOD(clearUserId) {
    [Growing clearUserId];
}

/// 发送自定义事件
/// @param eventId 事件Id, Id为正常英文数字组合的字符串, 长度<=1000, 请不要含有 "'|\*&$@/', 等特殊字符
/// @param variable 事件变量, 变量不能为nil
RCT_EXPORT_METHOD(track:(NSString *)eventId withVariable:(NSDictionary<NSString *, id> *)variable) {
    [Growing track:eventId withVariable:variable];
}

/// 发送用户事件
/// @param attributes 事件变量, 变量不能为nil
RCT_EXPORT_METHOD(setUserAttributes:(NSDictionary<NSString *, id>*)attributes) {
    [Growing setUserAttributes:attributes];
}

RCT_EXPORT_METHOD(setGeoLocation:(double)lat lng:(double)lgn) {
    [Growing setEnableLocationTrack:YES];
}

RCT_EXPORT_METHOD(clearGeoLocation) {
    // do nothing
}

@end
  
