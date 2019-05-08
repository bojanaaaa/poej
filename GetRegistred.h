//
//  GetRegistred.h
//  peoj
//
//  Created by Bojana Sladojevic on 30/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetRegistred : UIViewController <UITextFieldDelegate,UIScrollViewDelegate> 

@property (strong, nonatomic) IBOutlet UILabel *newsAppLabel;

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextFiled;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottom;

@property (strong, nonatomic) IBOutlet UILabel *wrongLabel2;


@property (strong, nonatomic) IBOutlet UITextField *passwordConfirmation;



- (IBAction)registerButton:(id)sender;


- (IBAction)logInButton:(id)sender;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@end

NS_ASSUME_NONNULL_END
