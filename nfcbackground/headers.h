@interface NFTagInternal
@property (nonatomic,copy,readonly) NSData *tagID;
@end

@interface NFDriverWrapper : NSObject
- (bool)restartDiscovery;
- (void)closeSession;
- (unsigned long long)openSession;
- (bool)disconnectTag:(NFTagInternal *)tag tagRemovalDetect:(bool)arg2;
@end

@interface NFBackgroundTagReadingManager {
	NFDriverWrapper *_driverWrapper;
}
- (id)_readNDEFFromTag:(NFTagInternal *)tag;
- (void)handleDetectedTags:(id)tags;
@end

@interface _NFHardwareManager {
	NFDriverWrapper *_driverWrapper;
}
- (void)handleRemoteTagsDetected:(id)arg1;
@end
