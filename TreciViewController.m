//
//  TreciViewController.m
//  peoj
//
//  Created by Bojana Sladojevic on 17/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "TreciViewController.h"
#import "Drugi.h"
#import "Cetvrti.h"
#import "Comments.h"
@interface TreciViewController ()


@end



@implementation TreciViewController
@synthesize nameLabel,data,tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    tableView.delegate=self;
    tableView.dataSource=self;
    
    NSLog(@"%@",data.body);
    nameLabel.text=data.name;
   
    
}




- (IBAction)backButton:(id)sender {
    
   [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)next:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Cetvrti *cartController = [sb instantiateViewControllerWithIdentifier:@"Cetvrti"];
    cartController.data = data;
    [self.navigationController pushViewController:cartController animated:YES];
    
}

#pragma Mark tableView delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
}


@end
