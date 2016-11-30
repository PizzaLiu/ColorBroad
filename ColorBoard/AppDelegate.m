//
//  AppDelegate.m
//  ColorBoard
//
//  Created by Rainbow on 16/11/28.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import "AppDelegate.h"
#import "PaletteViewController.h"
#import "ColorViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    NSArray *cvs = nav.viewControllers;
    int cvsCount = [cvs count];
    if (cvsCount > 1) {
        ColorViewController *cvc = nil;
        if (cvsCount == 2) {
            cvc = (ColorViewController *)cvs[1];
        } else {
            cvc = (ColorViewController *)cvs[2];
        }
        [cvc saveEditingColor];
    }
    PaletteViewController *pvc = (PaletteViewController *)cvs[0];
    [pvc saveColors];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}


@end
