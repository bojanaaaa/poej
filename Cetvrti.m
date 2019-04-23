//
//  Cetvrti.m
//  peoj
//
//  Created by Bojana Sladojevic on 22/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "Cetvrti.h"

@interface Cetvrti ()

@end

@implementation Cetvrti
@synthesize data,bodyTEXT,name,email2;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    name.text=data.name;
    email2.text=data.email;
    bodyTEXT.text=data.body;
    
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

- (IBAction)backButton2:(id)sender {
    
       [self.navigationController popViewControllerAnimated:YES];
    
}
@end
