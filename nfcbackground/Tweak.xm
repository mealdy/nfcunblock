#import "headers.h"

/**
  Many thanks to @arandomdev, who helps me understanding the science behind the sense. Original repo: https://github.com/arandomdev/jailbreak
 **/

%hook NFBackgroundTagReadingManager
- (id)initWithQueue:(id)arg1 driverWrapper:(id)arg2 lpcdHWSupport:(unsigned char)arg3 {
	return %orig(arg1, arg2, 1);
}

%end

// Added another hook to reset the NFC, thus you don't have to wait too long to discover your tags next time.

%hook _NFHardwareManager
- (void)handleRemoteTagsDetected:(id)arg1 {
	%orig;

  [NSThread sleepForTimeInterval:1.0];
  @try {
    [self restartDiscovery];
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
 }
}

%end