#import "Jointag.h"
#import <React/RCTLog.h>
#import <JTProximitySDK/JTProximitySDK.h>

@implementation Jointag

RCT_EXPORT_MODULE()

//RCT_EXPORT_METHOD(getConsent:(int)forVendor)
//{
//    RCTLogInfo(@"getConsent for Vendor %d", forVendor);
//    BOOL consent = [[JTProximitySDK sharedInstance] getGDPRConsentForVendor:forVendor];
//}

RCT_EXPORT_METHOD(setConsent:(int)forVendor value:(BOOL)value)
{
    RCTLogInfo(@"setConsent %s for Vendor %d", value ? "true" : "false", forVendor);
    [[JTProximitySDK sharedInstance] setGDPRConsent:value forVendor:forVendor];
}

@end