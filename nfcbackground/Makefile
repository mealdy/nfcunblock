ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NFCBackground
NFCBackground_FILES = Tweak.xm
NFCBackground_FRAMEWORKS = CoreNFC CoreFoundation
NFCBackground_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 nfcd;" || true
