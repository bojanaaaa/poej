//
//  NewsManager.m
//  peoj
//
//  Created by Bojana Sladojevic on 25/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "NewsManager.h"
#import "AFNetworking.h"
#import "Comments.h"

@implementation NewsManager{
    
    

}
@synthesize commentsArray;


+ (NewsManager *)sharedManager {
    static dispatch_once_t pred;
    static NewsManager *_sharedManager = nil;
    
    dispatch_once(&pred, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

-(void) initManager

{
    commentsArray=[NSMutableArray new];
    [self getData];
    
    
}

-(void)getData
{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://jsonplaceholder.typicode.com/comments"
      parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
          NSArray *array = (NSArray *)responseObject;
          
          [self parsData:array];
          
      } failure:^(NSURLSessionTask *operation, NSError *error) {
          NSLog(@"Error: %@", error);
          
      }];
    
    
}

-(void)parsData:(NSArray *)array
{
    for(NSDictionary *commD in array)
    {
        
        Comments *a=[Comments new];
        
        a.body=[commD objectForKey:@"body"];
        a.email=[commD objectForKey:@"email"];
        a.name=[commD objectForKey:@"name"];
        
        [commentsArray addObject:a];
        
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedLoading" object:nil];
}
@end
