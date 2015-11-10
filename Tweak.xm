#import "FSSwitchPanel.h"
#import "FSSwitchState.h"
%group MOD
%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application 
{
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		if ([[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.bluetooth"] == 1){
	        NSLog(@"[Pebble Profiles] - CYCLE BT");
	        [[FSSwitchPanel sharedPanel] setState:FSSwitchStateOff forSwitchIdentifier:@"com.a3tweaks.switch.bluetooth"];
	        [[FSSwitchPanel sharedPanel] setState:FSSwitchStateOn forSwitchIdentifier:@"com.a3tweaks.switch.bluetooth"];
	    }		
	});
}
%end
%end

static void PreferencesCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	CFPreferencesAppSynchronize(CFSTR("com.joemerlino.cyclebluetooth"));
}

%ctor{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesCallback, CFSTR("com.joemerlino.cyclebluetooth.preferencechanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.joemerlino.cyclebluetooth.plist"];
	BOOL enabled = ([prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : YES);
	if (enabled){
		NSLog(@"[Pebble Profiles] - CYCLE BT INIT");
        %init(MOD);
    }
}