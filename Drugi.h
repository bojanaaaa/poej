//
//  Drugi.h
//  peoj
//
//  Created by crazy on 3/11/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comments.h"
#import "TreciViewController.h"

//implements the second viewcontrollers "PassInformation" protocol




@interface Drugi : UIViewController <UITextFieldDelegate>




@property (strong, nonatomic) IBOutlet UITextField *text1;

@property (strong, nonatomic) IBOutlet UILabel *labela1;

@property (strong, nonatomic) IBOutlet UITextField *text2;

@property (weak, nonatomic) IBOutlet UIImageView *UIimage;

@property (weak, nonatomic) IBOutlet UILabel *labela3;

@property (strong, nonatomic) IBOutlet UILabel *labela2;

@property(strong,nonatomic) NSMutableArray *users;

- (IBAction)action:(id)sender;

- (IBAction)RememberMe:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailTop;

@end

