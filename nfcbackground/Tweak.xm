#import "headers.h"

/**
  Many thanks to @arandomdev, who helps me understanding the science behind the sense. Original repo: https://github.com/arandomdev/jailbreak
 **/

%hook NFBackgroundTagReadingManager
- (id)initWithQueue:(id)arg1 driverWrapper:(id)arg2 lpcdHWSupport:(unsigned char)arg3 {
	return %orig(arg1, arg2, 1);
}

%end

// Added another hook to reset the NFC, thus you don't have to wait too long to discover your tags

%hook _NFHardwareManager
- (void)handleRemoteTagsDetected:(id)arg1 {
	%orig;

	NSArray *tags = [arg1 allObjects];
	NFDriverWrapper *driver = MSHookIvar<NFDriverWrapper *>(self, "_driverWrapper");
	for(NFTagInternal *tag in tags) {
		[driver disconnectTag:tag tagRemovalDetect:1];
	}
  
	[NSThread sleepForTimeInterval:1.0];
	[driver openSession];
	[driver closeSession];
	[driver restartDiscovery];
}

%end