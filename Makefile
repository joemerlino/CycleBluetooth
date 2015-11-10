include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CycleBluetooth
CycleBluetooth_FILES = Tweak.xm
CycleBluetooth_LIBRARIES = Flipswitch

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += cycleprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
