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
#import "Remembered.h"
#import "RememberedArray.h"

@interface Drugi ()

@end

@implementation Drugi {
    NSString *email, *password;
    BOOL rememberMe;
    NSMutableArray *commentsArray;
    // *uspsArray;
    
}



@synthesize labela1, labela2,text1,text2,UIimage, emailTop;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Ovo je drugi view controller");
  
    

    [self getData];
    
   
 
    rememberMe=[self rememberMe];
    
    if (rememberMe)
    {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        text1.text = [defaults objectForKey:@"username"];
        text2.text = [defaults objectForKey:@"password"];
        
        
        //ups=[Remembered new];
        //ups=[self FindMe:uspsArray];
       // text1.text=usps.email;
       // text2.text=usps.password;
        
    }
    
    commentsArray=[NSMutableArray new];
    
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
     } else labela2.text=textField.text;}

-(BOOL)rememberMe
{
     NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
     rememberMe=[def boolForKey:@"rememberMe"];
    
   
    return rememberMe;
}


 - (IBAction)action:(id)sender {
  
    
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
         
        
         Comments *b=[Comments new];
         b=commentsArray[4];
        
         
         UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         TreciViewController *cartController = [sb instantiateViewControllerWithIdentifier:@"TreciViewController"];
         cartController.data = b;
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
        
        
        
        //NSLog(@"%@",a.body);
        
    }
    
   
}
- (void)passDataForward:(Comments *)b
{
    
     // Set the exposed property
    //[self.navigationController pushViewController:treci animated:YES];
    
}



/*(Remembered*)FindMe: (RememberedArray *) uspsArray
 {
 Remembered *pom=[Remembered new];
 // pravila sam niz jer vise ljudi moze biti upamceno na jednom uredjaju, ovde zelim omoguciti da se izabere zeljeni mejl pa po tome da mi se ucita lozinka za dati mejl ovo je trenutno rijesenje.
 pom.email=uspsArray.email;
 NSLog(@"%@ %@",pom.email,pom.password);
 pom.password=uspsArray.password;
 
 return pom;
 }*/
@end
