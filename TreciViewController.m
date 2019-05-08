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
#import "NavigationBar.h"

@interface TreciViewController ()


@end



@implementation TreciViewController
@synthesize nameLabel,tableView,commentsArray,user,navigationBar;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    navigationBar.delegate=self;
    tableView.delegate=self;
    tableView.dataSource=self;
  
    nameLabel.text=user.email;
    NSLog(@"user %@",user.email);
    
    commentsArray=[NewsManager sharedManager].commentsArray;
    
    NSLog(@"view did load");
}

- (void)viewWillAppear:(BOOL)animated{
    
    navigationBar.beckButton.hidden=YES;
    navigationBar.logOutButton.hidden=NO;
    navigationBar.nameLabel.text=user.email;
    
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"view did appear");
    
}



- (IBAction)next:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Cetvrti *cartController = [sb instantiateViewControllerWithIdentifier:@"Cetvrti"];
    
    [self.navigationController pushViewController:cartController animated:YES];
    
}
- (void)logOutButtonDelegate:(id)sender{
   
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Logout"
                                 message:@"Are You Sure Want to Logout!"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    
                                    BOOL rememberMe=NO;
                                    NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
                                    [def setBool:rememberMe forKey:@"rememberMe"];
                                    [def synchronize];
                                    
                                    [self.navigationController popViewControllerAnimated:YES];
                                    //Handle your yes please button action here
                                    
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    //Add your buttons to alert controller
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
    /*UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    topWindow.rootViewController = [UIViewController new];
    topWindow.windowLevel = UIWindowLevelAlert + 1;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"received Notification" preferredStyle:UIAlertControllerStyleAlert];
  
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"YES",@"confirm") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // continue your work
        
        // important to hide the window after work completed.
        // this also keeps a reference to the window until the action is invoked.
        topWindow.hidden = YES; // if you want to hide the topwindow then use this
         // if you want to remove the topwindow then use this
        BOOL rememberMe=NO;
        NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
        [def setBool:rememberMe forKey:@"rememberMe"];
        [def synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    
    [topWindow makeKeyAndVisible];
    [topWindow.rootViewController presentViewController:alert animated:YES completion:nil];*/
    

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


/*- (IBAction)logOut:(id)sender {
    
    BOOL rememberMe=NO;
    NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
    [def setBool:rememberMe forKey:@"rememberMe"];
    [self.navigationController popViewControllerAnimated:YES];
   
}*/
@end
