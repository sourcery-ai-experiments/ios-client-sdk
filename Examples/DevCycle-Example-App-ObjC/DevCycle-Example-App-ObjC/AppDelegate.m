//
//  AppDelegate.m
//  DevCycle-Example-App-ObjC
//
//

#import "AppDelegate.h"
#import "DevCycleManager.h"

@import DevCycle;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Builder
//    NSError *err = nil;
//    DVCUser *user = [DVCUser build:&err block:^(DVCUserBuilder *builder) {
//        builder.userId = @"test_user";
//    }];
//    [[DevCycleManager sharedManager] initialize:user];
//    [[DevCycleManager sharedManager].client variableWithKey:@"key" defaultValue:@"default" error:&err];
    
    // Init
    DVCUserBuilder *userBuilder = [DVCUserBuilder initializeWithUserId:@"test_user"];
    userBuilder.customData = @{@"key": @"value"};
    DVCClient *client = [[DevCycleManager sharedManager] initializeUserBuilder:userBuilder];
    

    DVCVariable *stringVar = [client stringVariableWithKey:@"string_key" defaultValue:@"default"];
    DVCVariable *numVar = [client numberVariableWithKey:@"num_key" defaultValue:@610];
    DVCVariable *boolVar = [client boolVariableWithKey:@"bool_key" defaultValue:true];
    DVCVariable *jsonVar = [client jsonVariableWithKey:@"json_key" defaultValue:@{@"key": @"value"}];
    
    NSLog(@"DVC Var Values\nstring: %@\n num: %@\n bool: %@\njson: %@", stringVar, numVar, boolVar, jsonVar); 
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
