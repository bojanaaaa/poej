//
//  TreciViewController.h
//  peoj
//
//  Created by Bojana Sladojevic on 17/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comments.h"
NS_ASSUME_NONNULL_BEGIN

@interface TreciViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

-(IBAction)backButton:(id)sender;

- (IBAction)next:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) Comments *data;
@end



NS_ASSUME_NONNULL_END
