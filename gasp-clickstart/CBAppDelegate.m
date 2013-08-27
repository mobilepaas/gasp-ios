#import "CBAppDelegate.h"
#import "CBViewController.h"

#import "TestFlight.h"

@implementation CBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
   
  // TestFlight SDK integration
  // [TestFlight takeOff:@"3b3540c6-1839-4e43-85c7-b54fac7e4b09"];
    
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    self.viewController = [[CBViewController alloc] initWithNibName:@"CBViewController_iPhone" bundle:nil];
  } else {
    self.viewController = [[CBViewController alloc] initWithNibName:@"CBViewController_iPad" bundle:nil];
  }
  self.window.rootViewController = self.viewController;
  [self registerForPush];
  [self.window makeKeyAndVisible];
  return YES;
}


/*
 * Tell Apple we want push messages
 */

- (void) registerForPush {
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
}




/*
 * respond to the call back, and tell the CloudBees push server about this device - this is called when installed on a phone - only
 * one time!
 */
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    // NSLog(@"My token is: %@", deviceToken);
    NSString* tokenAsString = [[[deviceToken description]
                                 stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]]
                                stringByReplacingOccurrencesOfString:@" " withString:@""];
    [CBViewController registerWithPushServer:tokenAsString];
    NSLog(@"APN Device Token: %@", tokenAsString);

}




/* 
 * When we get a push message - which came via the push app and SNS, this will be called 
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    for (id key in userInfo) {
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
    }
    [CBViewController showMessage:@"Gasp!" message:@"We have news for you"];
}




- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}








@end
