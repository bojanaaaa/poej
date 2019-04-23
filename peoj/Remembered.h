//
//  Remembered.h
//  peoj
//
//  Created by Bojana Sladojevic on 19/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Remembered : NSObject

@property (weak,nonatomic) NSString *password, *email;

-(void)setEmail:(NSString *)email;
-(void)setPassword:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
