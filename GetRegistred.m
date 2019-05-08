//
//  GetRegistred.m
//  peoj
//
//  Created by Bojana Sladojevic on 30/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "GetRegistred.h"
#import "Drugi.h"
#import "AFNetworking.h"
#import "User.h"
#import "UserManager.h"

@interface GetRegistred ()

@end

@implementation GetRegistred{
    NSMutableArray *users;
    NSString *temp;
}

@synthesize emailTextField, passwordTextFiled, newsAppLabel,scrollView,scrollViewBottom,wrongLabel2,passwordConfirmation;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    emailTextField.delegate=self;
    passwordTextFiled.delegate=self;
    passwordConfirmation.delegate=self;
    
    emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    passwordTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
     passwordConfirmation.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
   
    scrollView.delegate=self;
    
    //scroll
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)emailDidBeginEditing:(id)sender {
    emailTextField.text=temp;
}
- (IBAction)emailDidEndEditing:(id)sender {
     emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
}
- (IBAction)passwordDidBeginEditing:(id)sender {
    passwordTextFiled.placeholder=nil;
}
- (IBAction)passwordDidEndEditing:(id)sender {
    passwordTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
}


- (IBAction)registerButton:(id)sender {
    
    if([emailTextField.text length]==0){
    
        emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        
    }
    else {
        NSLog(@"exists %i",[[UserManager sharedManager]checkForEmail:emailTextField.text]);
        if([[UserManager sharedManager]checkForEmail:emailTextField.text])
            
        {
            temp=[NSString new];
            temp=emailTextField.text;
            emailTextField.text=@"";
            emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail already exists!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
            
            passwordTextFiled.text=@"";
            passwordTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
            return;
        }
        
    }
    
    
    if ([passwordTextFiled.text length]==0){
        
        passwordTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        
    }
    
    else if([passwordConfirmation.text isEqualToString:passwordTextFiled.text])
    {
        [[UserManager sharedManager]setUser:emailTextField.text and:passwordTextFiled.text];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Drugi *cartController = [sb instantiateViewControllerWithIdentifier:@"Drugi"];
        [self.navigationController pushViewController:cartController animated:YES];
    }
    else {
        /*User *user=[User new];
        user.email=emailTextField.text;
        user.password=passwordTextFiled.text;
        NSLog(@"%@",user.email);
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        users=[defaults objectForKey:@"users"];
        NSUInteger count=[users count];
        
        for(int i=0;i<count;i++)
        {
            User *temp=users[i];
            if(user.email==temp.email){
                
                emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail already exists!" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
                pom=1;
            }
                
        }
    if(pom==0)*/
        passwordConfirmation.text=@"";
    passwordConfirmation.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Not matching!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(next:) name:@"finished" object:nil];
    }
    
    
}

- (void)next: (NSNotification *)notification{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Drugi *cartController = [sb instantiateViewControllerWithIdentifier:@"Drugi"];
    [self.navigationController pushViewController:cartController animated:YES];
    
}

- (IBAction)logInButton:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Drugi *cartController = [sb instantiateViewControllerWithIdentifier:@"Drugi"];
    [self.navigationController pushViewController:cartController animated:YES];
    
}


#pragma mark Keyboard change methods

- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.3 animations:^{
        self->scrollViewBottom.constant = 0;
    }];
}

- (void)keyboardFrameWillChange:(NSNotification *)notification {
    
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [self.view layoutIfNeeded];
    
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    
    if (keyboardFrameEnd.size.height > 0) {
        scrollViewBottom.constant = keyboardFrameEnd.size.height + 20;
        [scrollView setContentOffset:CGPointMake(0, passwordTextFiled.frame.origin.y)];
        
    }
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}



@end

