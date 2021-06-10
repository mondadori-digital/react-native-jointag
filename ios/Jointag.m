#import "Jointag.h"
#import <React/RCTLog.h>
#import <JTProximitySDK/JTProximitySDK.h>

@implementation Jointag

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
 return @{ @"MANUAL_CONSENT_PROFILING": @(JTPManualConsentProfiling) };
 return @{ @"MANUAL_CONSENT_MONITORING": @(JTPManualConsentMonitoring) };
 return @{ @"MANUAL_CONSENT_ADVERTISING": @(JTPManualConsentAdvertising) };
}

RCT_EXPORT_METHOD(setConsent:(BOOL)value)
{
    RCTLogInfo(@"setConsent %s", value ? "1" : "0");
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *consent = value ? @"1" : @"0";
    [userDefaults setObject:consent forKey:@"IABTCF_PublisherCustomPurposesConsents"];

    [userDefaults synchronize];
}

RCT_EXPORT_METHOD(setManualConsent:(NSString *)type value:(BOOL)value)
{
    RCTLogInfo(@"setManualConsent %s %s", type, value ? "1" : "0");
    NSLog(@"setManualConsent %s %s", type, value ? "1" : "0");
    
    [JTProximitySDK.sharedInstance setManualConsent:value forType:type];
}

RCT_EXPORT_METHOD(getAdvertisingId:(RCTPromiseResolveBlock)resolve 
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *advID = [JTProximitySDK sharedInstance].advertisingId;
    NSLog(@"getAdvertisingId %s", advID);
    resolve(advID);
}

RCT_EXPORT_METHOD(getInstallationId:(RCTPromiseResolveBlock)resolve 
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *instID = [JTProximitySDK sharedInstance].installationId;
    resolve(instID);
}

@end
