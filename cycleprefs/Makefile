include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CyclePrefs
CyclePrefs_FILES = CBTRootListController.m
CyclePrefs_INSTALL_PATH = /Library/PreferenceBundles
CyclePrefs_FRAMEWORKS = UIKit
CyclePrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CyclePrefs.plist$(ECHO_END)
