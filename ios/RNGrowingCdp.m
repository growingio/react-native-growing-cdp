
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
RCT_EXPORT_METHOD(startWithProjectId:(NSString *)projectId dataSourceId:(NSString *)dataSourceId) {
    [Growing startWithAccountId:projectId dataSourceId:dataSourceId];
}

/// 设置数据收集平台服务器地址
/// @param host 私部的域名
RCT_EXPORT_METHOD(setTrackerHost:(NSString *)host) {
    [Growing setTrackerHost:host];
}

/// 命令行输出调试日志，默认为NO
/// @param enable 是否打开日志
RCT_EXPORT_METHOD(setEnableDebugMode:(BOOL)enable) {
    [Growing setEnableLog:enable];
}

RCT_REMAP_METHOD(getEnableDebugMode,
                 debugResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    BOOL enable = [Growing getEnableLog];
    NSDictionary *data = @{@"debug": @(enable)};
    resolve(data);
}

RCT_REMAP_METHOD(sdkVersion,
                 sdkVersionResolver:(RCTPromiseResolveBlock)resolve
                rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *version = [Growing sdkVersion];
    NSDictionary *data = @{@"version": version};
    resolve(data);
}


/// 设置项目URL Scheme ,该函数请在main函数第一行调用
/// @param urlScheme URL Scheme
RCT_EXPORT_METHOD(setUrlScheme:(NSString *)urlScheme) {
    [Growing setUrlScheme:urlScheme];
}

/// 获取 URL Scheme
/// @param reject 此方法只返回您的赋值
RCT_REMAP_METHOD(getUrlScheme,
                 urlSchemeResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {

    NSString *urlScheme = [Growing getUrlScheme];
    NSDictionary *data = @{@"scheme": urlScheme};
    resolve(data);
}

/// 设置发送数据的时间间隔（单位为秒）
/// @param interval 时间间隔
RCT_EXPORT_METHOD(setFlushInterval:(NSTimeInterval)interval) {
    [Growing setFlushInterval:interval];
}

RCT_REMAP_METHOD(getFlushInterval,
                 flushIntervalResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {

    NSTimeInterval interval = [Growing getFlushInterval];
    NSDictionary *data = @{@"interval": @(interval)};
    resolve(data);
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

RCT_EXPORT_METHOD(setDailyDataLimit:(NSUInteger)limit) {
    [Growing setDailyDataLimit:limit];
}

RCT_REMAP_METHOD(getDailyDataLimit,
                 dataLimitResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {

    NSUInteger limit = [Growing getDailyDataLimit];
    NSDictionary *data = @{@"limit": @(limit)};
    resolve(data);
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

@end
  
