//
//  RememberedArray.m
//  peoj
//
//  Created by Bojana Sladojevic on 19/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "RememberedArray.h"

@implementation RememberedArray

-(void)setRememberedArray:(Remembered * )usps
{
    [self setEmail:usps.email];
    [self setPassword:usps.password];
}
@end
