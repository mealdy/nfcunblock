ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NFCUnblock
NFCUnblock_FILES = Tweak.xm
NFCUnblock_CFLAGS = -fobjc-arc
NFCUnblock_PRIVATEFRAMEWORKS = WorkflowKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Shortcuts; killall -9 SpringBoard" || true