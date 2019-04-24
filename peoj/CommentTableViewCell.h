//
//  CommentTableViewCell.h
//  peoj
//
//  Created by Bojana Sladojevic on 23/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

NS_ASSUME_NONNULL_END
