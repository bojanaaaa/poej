//
//  SplashScreenViewController.m
//  peoj
//
//  Created by crazy on 2/15/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //instanciramo app delegate, da mozem oda pristupimo njegovim funkcijama
    AppDelegate *applicationDelegate = [[UIApplication sharedApplication] delegate];
    //pozivamo funkciju app delegate koja ce da prikaze nas pocetni ekran
    //ako ti se ne prikaze ova funkcija, moras je dodati u .h fajl
    [applicationDelegate openAppHome];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
