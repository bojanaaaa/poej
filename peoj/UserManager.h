//
//  UserManager.h
//  peoj
//
//  Created by Bojana Sladojevic on 25/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserManager : NSObject
+ (UserManager *)sharedManager;

@property(strong,nonatomic) NSMutableArray *users;
-(void)initUserManager:(User *)user;

@end

NS_ASSUME_NONNULL_END
