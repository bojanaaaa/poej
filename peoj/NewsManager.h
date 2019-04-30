//
//  NewsManager.h
//  peoj
//
//  Created by Bojana Sladojevic on 25/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsManager : NSObject

+ (NewsManager *)sharedManager;
@property (strong,nonatomic) NSMutableArray *commentsArray;

-(void) initManager;
@end

NS_ASSUME_NONNULL_END
