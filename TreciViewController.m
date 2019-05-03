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
#import "CommentTableViewCell.h"

@interface TreciViewController ()


@end



@implementation TreciViewController
@synthesize nameLabel,tableView,commentsArray,user;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    tableView.delegate=self;
    tableView.dataSource=self;
  
    nameLabel.text=user.email;
    NSLog(@"user %@",user.email);
    
    commentsArray=[NewsManager sharedManager].commentsArray;
    
   
}




- (IBAction)backButton:(id)sender {
    
   [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)next:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Cetvrti *cartController = [sb instantiateViewControllerWithIdentifier:@"Cetvrti"];
    
    [self.navigationController pushViewController:cartController animated:YES];
    
}

#pragma Mark tableView delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"CommentTableViewCell"];
    CommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell"];
    
    
    Comments *comment=[commentsArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text=comment.name;
    cell.emailLabel.text=comment.email;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [commentsArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Comments *commentAtSelectedRow=[commentsArray objectAtIndex:indexPath.row];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Cetvrti *cartController = [sb instantiateViewControllerWithIdentifier:@"Cetvrti"];
    cartController.data = commentAtSelectedRow;
    [self.navigationController pushViewController:cartController animated:YES];
    
}

@end
