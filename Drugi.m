//
//  Drugi.m
//  peoj
//
//  Created by crazy on 3/11/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "Drugi.h"
#import "TreciViewController.h"
#import "AFNetworking.h"
#import "Comments.h"
#import "User.h"
#import "GetRegistred.h"
#import "UserManager.h"

@interface Drugi ()

@end

@implementation Drugi {
    NSString *email, *password;
    BOOL rememberMe;
    User *user;
   
}

@synthesize labela1, labela2,text1,text2,UIimage, emailTop,users,scrollViewBottom,scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Ovo je drugi view controller");
    
    scrollView.delegate=self;
    
    //user=[User new];
    //users=[[NSMutableArray alloc]init];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    rememberMe=[self rememberMe];
    
    if (rememberMe)
    {
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        text1.text = [defaults objectForKey:@"username"];
        text2.text = [defaults objectForKey:@"password"];
        
        _labela3.textColor=[UIColor blackColor];
        UIimage.image = [UIImage imageNamed: @"check_active"];
        
        user.email=text1.text;
        user.password=text2.text;
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TreciViewController *cartController = [sb instantiateViewControllerWithIdentifier:@"TreciViewController"];
        cartController.user = user;
        
        //[self.navigationController pushViewController:cartController animated:YES];
            }

    text1.delegate = self;
    //[text1 addTarget:self action:@selector( textFieldDidChange:)
    //forControlEvents:UIControlEventEditingChanged];
    text2.delegate = self;
    //[text2 addTarget:self action:@selector (textFieldDidChange:)
    //forControlEvents:UIControlEventEditingChanged];
    
   // email=@"tekst";
   //password=@"teks";
    
    text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    if ( IS_IPHONE_5)
    {
        emailTop.constant=10;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*-(void)textFieldDidChange:(UITextField *)textField {
    if(textField==text1) {
        labela1.text=textField.text;
    } else labela2.text=textField.text;
    
}*/
-(BOOL)rememberMe
{
    NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
    rememberMe=[def boolForKey:@"rememberMe"];
    
    return rememberMe;
}
- (IBAction)action:(id)sender {
    
    User *new=[User new];
    new.email=text1.text;
    new.password=@"";
    User *temp=[User new];
    
    
   
   
    NSMutableArray *users=[NSMutableArray new];
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
   
    users=[defaults objectForKey:@"users"];
    NSUInteger count=[users count];
    
   if ( [text1.text length]==0 )
        
        text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
   /*else if ([text1.text isEqualToString: email ])
    text1.text=text1.text;
    
    else {
        text1.text=@"";
        text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorect" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    }*/
    if ( [text2.text length]==0 )
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    for(int i=0;i<count;i++){
        
        temp=users[i];
        if(temp.email==new.email)
            new.password=temp.password;

    }
    
    if(new.password!=text2.text)
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorect" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    if([new.password length]==0){
        
        labela1.text=@"GET REGISTRED";
        text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
        
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
        
    }
    /*else if ([text2.text isEqualToString: password ])
        text2.text=text2.text;
    
    else {
        text2.text=@"";
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorect" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];  }
   // [text1.text isEqualToString: email]
    if ( [text2.text isEqualToString: password] )
        
    {
       
        user.email=text1.text;
        user.password=text2.text;
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TreciViewController *cartController = [sb instantiateViewControllerWithIdentifier:@"TreciViewController"];
        cartController.user = user;
        
      
        [self.navigationController pushViewController:cartController animated:YES];
        
    }*/
    
}
- (IBAction)RememberMe:(id)sender {
    
    rememberMe=!rememberMe;
    
    if (rememberMe)
    {
        
        _labela3.textColor=[UIColor blackColor];
        UIimage.image = [UIImage imageNamed: @"check_active"];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:text1.text forKey:@"username"];
        [defaults setObject:text2.text forKey:@"password"];
        [defaults synchronize];
    
    }
    
    else
    {_labela3.textColor=[UIColor grayColor];
        
        UIimage.image = [UIImage imageNamed: @"check_unactive"];
    }
    
    NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
    [def setBool:rememberMe forKey:@"rememberMe"];
    
    [def synchronize];
    
}

- (IBAction)getRegistredButton:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GetRegistred *cartController = [sb instantiateViewControllerWithIdentifier:@"GetRegistred"];
    
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
        [scrollView setContentOffset:CGPointMake(0, text2.frame.origin.y)];
        
    }
    
    
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

