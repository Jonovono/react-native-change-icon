#import "React/RCTLog.h"
#import "RNChangeIcon.h"

@implementation RNChangeIcon

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(changeIcon:(NSString *)iconName)
{
      NSError *error = nil;
    // Not supported
    if ([[UIApplication sharedApplication] supportsAlternateIcons] == NO) {
        // reject(@"Error", @"Alternate icon not supported", error);
        RCTLog(@"Alternate icons are not supported");
        return;
    }

    NSString *currentIcon = [[UIApplication sharedApplication] alternateIconName];

    if ([iconName isEqualToString:currentIcon]) {
        // reject(@"Error", @"Icon already in use", error);
        RCTLog(@"Icon already in use");
        return;
    }

    // resolve(@(YES));

    // Custom icon
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        RCTLog(@"%@", [error description]);
    }];
}

@end
