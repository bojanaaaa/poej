//
//  AppDelegate.h
//  peoj
//
//  Created by crazy on 1/8/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Drugi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//@property (nonatomic, retain) UINavigationController *navigationController;
//@property (nonatomic, retain) Drugi * drugi;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (void)openAppHome;
@end

