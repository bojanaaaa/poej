//
//  AppDelegate.m
//  peoj
//
//  Created by crazy on 1/8/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end


@implementation AppDelegate
//@synthesize navigationController, drugi;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   /* self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //create the navigation controller and add to the view
    navigationController = [[UINavigationController alloc] init];
    [self.window addSubview:[self.navigationController view]];
    
    //check if the first viewcontroller eixsts, otherwise create it
    if(self.drugi == nil)
    {
        Drugi *firstView = [[Drugi alloc] init];
        self.drugi = firstView;
    }
    
    //push the first viewcontroller into the navigation viewcontroller stack
    [self.navigationController pushViewController:self.drugi animated:YES];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    */
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

- (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectContext *)managedObjectContext{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"peoj" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"peoj.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (void)openAppHome {
    
    //ovde dobijemo nas UIViewController iz storyboard-a.
    //instantiateViewControllerWithIdentifier se odnosi na storyboard ID
    //kontrolera koji si stavila u storyboard
    UIViewController *home = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Drugi"];
    
    //UI navigation controller kontrolise tok aplikacije, on prikazuje ili sklanja ekrane
    //Ovde njega pozovemo, kreiramo ga sa alloc init i damo mu neke parametre
    //background color white je i sklanjanje default navigation bar-a je standard
    //obico se pravi custom navigation bar
    UINavigationController *navVC = [[UINavigationController alloc] init];
    navVC.view.backgroundColor = [UIColor whiteColor];
    [navVC setNavigationBarHidden:YES];
    //push je funkcija navigation controllera koja prikaze ekran koji smo rekli, u ovom slucaju
    //taj novi koji si ti napravila
    [navVC pushViewController:home animated:NO];
    
    //self se odnosi na app delegate ( koji predstavlja aplikaciju )
    //stavljamo nas navigation controller da bude root, i od tada mozemo da kontrolisemo ekrane preko njega
    [self.window setRootViewController:navVC];
}

@end
