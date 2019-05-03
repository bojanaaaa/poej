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
NS_ASSUME_NONNULL_BEGIN

@interface TreciViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

-(IBAction)backButton:(id)sender;

- (IBAction)next:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) User *user;
@property(strong, nonatomic) NSArray *commentsArray;
@end



NS_ASSUME_NONNULL_END
