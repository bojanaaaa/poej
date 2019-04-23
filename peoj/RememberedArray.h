//
//  RememberedArray.h
//  peoj
//
//  Created by Bojana Sladojevic on 19/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Remembered.h"
NS_ASSUME_NONNULL_BEGIN

@interface RememberedArray : Remembered

@property (weak,nonatomic) NSArray *usps;

-(void)setRememberedArray:(Remembered * )usps;

@end

NS_ASSUME_NONNULL_END
