//
//  PRAZANViewController.m
//  peoj
//
//  Created by Bojana Sladojevic on 08/05/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "PRAZANViewController.h"
#import "NavigationBar.h"
@interface PRAZANViewController ()

@end

@implementation PRAZANViewController
@synthesize navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    navigationBar.delegate=self;
    [self returnnothing];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    
    navigationBar.beckButton.hidden=NO;
    
    navigationBar.logOutButton.hidden=YES;
    
}
- (void)backButtonDelegate:(id)sender{
    
     [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
