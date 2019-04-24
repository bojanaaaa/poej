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

@interface Drugi ()

@end

@implementation Drugi {
    NSString *email, *password;
    BOOL rememberMe;
    NSMutableArray *commentsArray;
    
    User *user;
    //NSArray *users;
}

@synthesize labela1, labela2,text1,text2,UIimage, emailTop,users;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Ovo je drugi view controller");
    
    commentsArray=[NSMutableArray new];
    user=[User new];
    users=[[NSMutableArray alloc]init];
    
    [self getData];
    
    
    rememberMe=[self rememberMe];
    
    if (rememberMe)
    {
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        text1.text = [defaults objectForKey:@"username"];
        text2.text = [defaults objectForKey:@"password"];
        
        _labela3.textColor=[UIColor blackColor];
        UIimage.image = [UIImage imageNamed: @"check_active"];
        
    }

    text1.delegate = self;
    
    [text1 addTarget:self action:@selector( textFieldDidChange:)
    forControlEvents:UIControlEventEditingChanged];
    
    text2.delegate = self;
    
    [text2 addTarget:self action:@selector (textFieldDidChange:)
    forControlEvents:UIControlEventEditingChanged];
    
    email=@"tekst";
    password=@"teks";
    
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
-(void)textFieldDidChange:(UITextField *)textField {
    if(textField==text1) {
        labela1.text=textField.text;
    } else labela2.text=textField.text;
    
}
-(BOOL)rememberMe
{
    NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
    rememberMe=[def boolForKey:@"rememberMe"];
    
    return rememberMe;
}
- (IBAction)action:(id)sender {
    
    User *new=[User new];
    
    new.email=text1.text;
    new.password=text2.text;
    [users addObject:new];
    
    if ( [text1.text length]==0 )
        
        text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    else if ([text1.text isEqualToString: email ])
        text1.text=text1.text;
    
    else {
        text1.text=@"";
        text1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorect" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    
    if ( [text2.text length]==0 )
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password is reqired!" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    else if ([text2.text isEqualToString: password ])
        text2.text=text2.text;
    
    else {
        text2.text=@"";
        text2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorect" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];  }
    
    if ([text1.text isEqualToString: email] && [text2.text isEqualToString: password] )
        
    {
       
        user.email=text1.text;
        user.password=text2.text;
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TreciViewController *cartController = [sb instantiateViewControllerWithIdentifier:@"TreciViewController"];
        cartController.user = user;
        
        cartController.commentsArray=commentsArray;
        [self.navigationController pushViewController:cartController animated:YES];
        
    }
    
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
-(void)getData
{
    NSLog(@"1");
    
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
    
}

/*-(void)printData:(NSArray *)array{
 User *user;
 
 for(NSDictionary *commD in array)
 {
 user.email=[commD objectForKey:@"email"];
 user.password=[commD objectForKey:@"body"];
 NSLog(@"%@",user.email);
 
 }
 NSLog(@"Radim");
 }*/


@end

