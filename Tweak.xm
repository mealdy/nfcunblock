%hook WFNFCTrigger

// This is dead simple, right? Why would Apple disable the feature that actually works?

+ (BOOL)isSupportedOnThisDevice {
  return true;
}
%end