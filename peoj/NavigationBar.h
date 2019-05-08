//
//  NavigationBar.h
//  peoj
//
//  Created by Bojana Sladojevic on 07/05/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NavigationBar;
@protocol NavigationBarDelegate <NSObject>
@optional
- (IBAction)backButtonDelegate:(id)sender;
- (IBAction)logOutButtonDelegate:(id)sender;
@end

@interface NavigationBar : UIView

@property(strong,nonatomic) id <NavigationBarDelegate>delegate;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


- (IBAction)backButton:(id)sender;
- (IBAction)logOutButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *logOutButton;
@property (strong, nonatomic) IBOutlet UIButton *beckButton;



@end

NS_ASSUME_NONNULL_END
