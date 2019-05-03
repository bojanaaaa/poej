//
//  User.h
//  peoj
//
//  Created by Bojana Sladojevic on 24/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

@property (strong,nonatomic) NSString *email, *password;

@end

NS_ASSUME_NONNULL_END
