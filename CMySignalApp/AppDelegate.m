//
//  AppDelegate.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "AppDelegate.h"

#import "CMyLocalDatas.h"

#import "MainViewControler.h"
#import "CMyUserLogingViewController.h"
#import "CMyWorkerLogingViewController.h"

#import "CMyTestCreateworkers.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [ [UIWindow alloc] init ];
    self.window.rootViewController = [ [MainViewControler alloc] init ];
    [ self.window setFrame:[ [UIScreen mainScreen] bounds ] ];

    [ self.window makeKeyAndVisible ];
    
//    CMyTestCreateworkers* ptest = [ [CMyTestCreateworkers alloc] init ];
    if ([ [CMyLocalDatas SharedLocalDatas] getlocallogined ])
    {
        [ self showoperateview ];
    }
    else
    {
        [ self showloginview ];
    }
    
//    NSString* suserid = [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ];
//    NSLog(@"userid:%@", suserid);
//    if (suserid == nil || [ suserid length ] <1 || [suserid isEqualToString:@"(null)"] )
//    {
//        [ self showloginview ];
//    }
//    else
//    {
//        [ self showoperateview ];
//    }
    
    return YES;
}

-(void) showloginview
{
#if (__TYPE__==__USER__)
    CMyUserLogingViewController* ploginview = [ [CMyUserLogingViewController alloc] init ];
    self.window.rootViewController = ploginview;
#else if (__TYPE__==__WORKER__)
    CMyWorkerLogingViewController* ploginview = [ [CMyWorkerLogingViewController alloc] init ];
    self.window.rootViewController = ploginview;
#endif
}

-(void) showoperateview
{
    MainViewControler* pmainview = [ [MainViewControler alloc] init ];
    self.window.rootViewController = pmainview;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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

@end
