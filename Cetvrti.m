//
//  Cetvrti.m
//  peoj
//
//  Created by Bojana Sladojevic on 22/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "Cetvrti.h"
#import "AFNetworking.h"
#import "NavigationBar.h"
#import "PRAZANViewController.h"
@interface Cetvrti ()

@end

@implementation Cetvrti

@synthesize data,body,name,email2,navigationBar,uiImage;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    navigationBar.delegate=self;
    
    name.text=data.name;
    email2.text=data.email;
    body.text=data.body;
    
    NSURL* url =[NSURL URLWithString:@"https://via.placeholder.com/150/771796"];
    NSData *data= [[NSData alloc] initWithContentsOfURL:url];
    uiImage.image= [UIImage imageWithData:data];
    
    
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{

    navigationBar.beckButton.hidden=NO;
    navigationBar.logOutButton.hidden=YES;
    navigationBar.nameLabel.text=data.email;

}
/*-(UIImage*)getData
{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://via.placeholder.com/150/771796"
      parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
          self->image = (UIImage *)responseObject;
          
          
      } failure:^(NSURLSessionTask *operation, NSError *error) {
          NSLog(@"Error: %@", error);
          
      }];
    return image;
}*/

    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)backButtonDelegate:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dothat:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PRAZANViewController *cartController = [sb instantiateViewControllerWithIdentifier:@"PRAZANViewController"];
    
    [self.navigationController pushViewController:cartController animated:YES];
}
@end
