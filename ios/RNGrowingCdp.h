
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNGrowingCdp : NSObject <RCTBridgeModule>


/// 初始化项目，建议在 didFinishLaunchingWithOptions 调用
/// @param projectId 项目ID
/// @param dataSourceId 数据源ID
+ (void)startWithProjectId:(NSString *)projectId dataSourceId:(NSString *)dataSourceId;

/// 设置私部服务地址
/// @param host 私部服务地址
+ (void)setTrackerHost:(NSString *)host;

/// 是否开启日志
/// @param enable 是否开启
+ (void)setEnableDebugMode:(BOOL)enable;

/// 设置、获取发送数据的时间间隔，默认值为30秒，单位：秒
/// @param interval 间隔
+ (void)setFlushInterval:(NSTimeInterval)interval;

/// 设置每天使用数据网络（2G、3G、4G）上传的数据量的上限（单位是 KB）
/// @param limit 数据流量上限
+ (void)setDailyDataLimit:(NSUInteger)limit;

+ (NSUInteger)getDailyDataLimit;

@end
  
