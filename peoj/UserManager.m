//
//  UserManager.m
//  peoj
//
//  Created by Bojana Sladojevic on 25/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "UserManager.h"
#import "User.h"

@implementation UserManager
@synthesize users;
+ (UserManager *)sharedManager {
    static dispatch_once_t pred;
    static UserManager *_sharedManager = nil;
    
    dispatch_once(&pred, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

-(void)initUserManager:(User *)user{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    users=[NSMutableArray new];
    users=[defaults objectForKey:@"users"];
    [users addObject:user];
    
    [defaults setObject:users forKey:@"users"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"finished" object:nil];
    /* [self setUser:user inArray:users];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(next:) name:@"finishedLoading" object:nil];
    
     */
}
/*-(void)setUser:(User *)user inArray:(NSMutableArray*)users{
    
    [users addObject:user];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedLoading" object:nil];
}

-(void)next:(NSMutableArray*)users{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:users forKey:@"users"];
    
}*/
@end
