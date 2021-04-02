#import "Jointag.h"
#import <React/RCTLog.h>
#import <JTProximitySDK/JTProximitySDK.h>

@implementation Jointag

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setConsent:(BOOL)value)
{
    RCTLogInfo(@"setConsent %s", value ? "1" : "0");
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *consent = value ? @"1" : @"0";
    [userDefaults setObject:consent forKey:@"IABTCF_PublisherCustomPurposesConsents"];

    [userDefaults synchronize];
}

RCT_EXPORT_METHOD(getAdvertisingId:(RCTPromiseResolveBlock)resolve 
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *advID = [JTProximitySDK sharedInstance].advertisingId;
    resolve(advID);
}

RCT_EXPORT_METHOD(getInstallationId:(RCTPromiseResolveBlock)resolve 
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *instID = [JTProximitySDK sharedInstance].installationId;
    resolve(instID);
}

@end