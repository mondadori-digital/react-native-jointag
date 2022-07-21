#import "Jointag.h"
#import <React/RCTLog.h>
#import <JTProximitySDK/JTProximitySDK.h>

@implementation Jointag

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
 return @{ @"MANUAL_CONSENT_PROFILING": @"MANUAL_CONSENT_PROFILING",
           @"MANUAL_CONSENT_MONITORING": @"MANUAL_CONSENT_MONITORING",
           @"MANUAL_CONSENT_ADVERTISING": @"MANUAL_CONSENT_ADVERTISING"
           };
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
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
    
    if([type isEqualToString:@"MANUAL_CONSENT_PROFILING"]) {
        [JTProximitySDK.sharedInstance setManualConsent:value forType:@(JTPManualConsentProfiling)];
        RCTLogInfo(@"setManualConsent Profiling");
    } else if([type isEqualToString:@"MANUAL_CONSENT_MONITORING"]) {
        [JTProximitySDK.sharedInstance setManualConsent:value forType:@(JTPManualConsentMonitoring)];
        RCTLogInfo(@"setManualConsent Monitoring");
    } else if([type isEqualToString:@"MANUAL_CONSENT_ADVERTISING"]) {
        [JTProximitySDK.sharedInstance setManualConsent:value forType:@(JTPManualConsentAdvertising)];
        RCTLogInfo(@"setManualConsent Advertising");
    }
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
