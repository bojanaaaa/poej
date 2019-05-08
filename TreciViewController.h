//
//  TreciViewController.h
//  peoj
//
//  Created by Bojana Sladojevic on 17/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comments.h"
#import "User.h"
#import "NavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface TreciViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NavigationBarDelegate>



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet NavigationBar *navigationBar;

@property (strong, nonatomic) User *user;
@property(strong, nonatomic) NSArray *commentsArray;
@end



NS_ASSUME_NONNULL_END
